import Foundation
import os.log
import CoreGraphics
 
class SystemTimeLogger {
    private let timerInterval = 1.0 // Time interval in seconds
    private let logger = Logger(subsystem: "com.invinsense.agent", category: "TimeLogging")
    private let outputFilePath = "\(NSHomeDirectory())/Desktop/output.txt"
    
    func startLogging() {
        Timer.scheduledTimer(withTimeInterval: timerInterval, repeats: true) { _ in
            self.logCurrentTime()
        }
        RunLoop.current.run() // Keep the run loop running to allow the timer to fire
    }
    
    private let osLogger = OSLog(subsystem: "com.yourcompany.systemtimelogger", category: "TimeLogging")

private func logCurrentTime() {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let currentTime = formatter.string(from: Date())
    if isUserLoggedIn() {
        let logMessage = "User is logged in - Current Time: \(currentTime)\n"
        writeToLogFile(logMessage)
        os_log("%{public}s", log: osLogger, type: .info, logMessage)
    } else {
        let logMessage = "No user is logged in - Logging skipped.\n"
        writeToLogFile(logMessage)
        os_log("%{public}s", log: osLogger, type: .debug, logMessage)
    }
}


    
    private func isUserLoggedIn() -> Bool {
        guard let sessionInfo = CGSessionCopyCurrentDictionary() as? [String: AnyObject] else { return false }
        return sessionInfo["kCGSessionOnConsoleKey"] as? Bool ?? false
    }
    
    private func writeToLogFile(_ message: String) {
        if let fileHandle = FileHandle(forWritingAtPath: outputFilePath) {
            fileHandle.seekToEndOfFile()
            fileHandle.write(message.data(using: .utf8)!)
            fileHandle.closeFile()
        } else {
            try? message.write(toFile: outputFilePath, atomically: true, encoding: .utf8)
        }
    }
}
 
// Starting the logger
let logger = SystemTimeLogger()
logger.startLogging()

## loginsessionAgent

This Swift project implements a system time logger that periodically records the current time and logs it to both a file and the system log. The logger operates on a timer interval, logging the time at regular intervals. It checks whether a user is logged in and records the time accordingly. The logged information includes whether a user is logged in or not, along with the current time. The project provides flexibility for users to customize the output file path. Additionally, it utilizes the `os.log` framework for system-level logging and integrates with CoreGraphics for session management.

### Setup Instructions:

1. **Unload the Info.plist:**
   ```bash
   sudo launchctl unload -w /Users/mranv/Desktop/test/agent/agent/info.plist
   ```
2. **Load the Info.plist:**

   ```bash
   launchctl load -w /Users/mranv/Desktop/test/agent/agent/info.plist
   ```

3. **Start the agent:**

   ```bash
   launchctl start com.invinsense.agent
   ```

4. **Compile and run the Swift program:**

   ```bash
   swiftc main.swift -o agent
   ```

5. **Make sure to change the following line in Info.plist according to your directory:**
   ```xml
   <string>/Users/mranv/Desktop/test/agent/agent/agent</string>
   ```

### Usage:

Once the setup is completed, the application will start logging system time at regular intervals. You can find the logged information in the file named `output.txt` on your desktop.

---

### Command History:

```bash
# Command history for setting up the agent application
1659  sudo launchctl unload -w /Users/mranv/Desktop/test/agent/agent/info.plist
1660  launchctl load -w /Users/mranv/Desktop/test/agent/agent/info.plist
1661  launchctl start com.invinsense.agent
1675  swift main.swift
1679  swiftc main.swift -o agent\n
```

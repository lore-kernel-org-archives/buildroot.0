From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 16 Feb 2016 14:38:16 +0000
Subject: [Buildroot] [Bug 8651] libMonoPosixHelper.so wrong link reference
 in buildroot image
In-Reply-To: <bug-8651-163@https.bugs.busybox.net/>
References: <bug-8651-163@https.bugs.busybox.net/>
Message-ID: <bug-8651-163-155UDOB7cf@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8651

--- Comment #8 from Markus Egle <Markus.Egle@Qiagen.com> ---
Created attachment 6331
  --> https://bugs.busybox.net/attachment.cgi?id=6331&action=edit
Archive with SimpleSerialPortOpen.exe

            SerialPort sp = new SerialPort("/dev/ttyS0", 19200);
            try
            {
                sp.Open();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }


creates the error that libMonoPosixHelper.so couldn't be found.

-- 
You are receiving this mail because:
You are on the CC list for the bug.

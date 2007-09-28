From: Hebbar <gururajakr@sanyo.co.in>
Date: Thu, 27 Sep 2007 22:32:49 -0700 (PDT)
Subject: [Buildroot] unable to run busybox built with buildroot for am926ejs
	toolchain
Message-ID: <12934879.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

      Here is the issue,wheni try the busybox built with buildroot arm926ejs
toolchian (gcc 4.2.1 uclibc 0.9.29) it goes up to executing sh and then
repeating itself. it ask to press enter to activate & even if i does it
repeats. So kindly can some one share a working busybox 1.7.1 config with
proper device table list so that i can generate the same.  

Thanks in advance 

regards
Gururaja




<snip>
process '-/bin/sh' (pid 233) exited. Scheduling it for restart.

starting pid 235, tty '/dev/ttyAMA0': '/bin/sh'
process '/bin/sh ' (pid 235) exited. Scheduling it for restart.

Please press Enter to activate this console.
starting pid 236, tty '/dev/ttyAMA0': '/bin/sh'
process '-/bin/sh' (pid 236) exited. Scheduling it for restart.

Please press Enter to activate this console.
starting pid 237, tty '/dev/ttyAMA0': '/bin/sh'

starting pid 238, tty '/dev/ttyAMA0': '/bin/sh'
process '/bin/sh ' (pid 237) exited. Scheduling it for restart.
process '-/bin/sh' (pid 238) exited. Scheduling it for restart.

Please press Enter to activate this console.
Please press Enter to activate this console.
starting pid 239, tty '/dev/ttyAMA0': '/bin/sh'
process '/bin/sh ' (pid 239) exited. Scheduling it for restart.

Please press Enter to activate this console.
starting pid 240, tty '/dev/ttyAMA0': '/bin/sh'
process '-/bin/sh' (pid 240) exited. Scheduling it for restart.

Please press Enter to activate this console.
starting pid 241, tty '/dev/ttyAMA0': '/bin/sh'
process '/bin/sh ' (pid 241) exited. Scheduling it for restart.

Please press Enter to activate this console.
-- 
View this message in context: http://www.nabble.com/unable-to-run-busybox-built-with-buildroot-for-am926ejs-toolchain-tf4532557.html#a12934879
Sent from the BuildRoot mailing list archive at Nabble.com.

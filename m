From: LogiSch17 <logi.tss@hotmail.de>
Date: Mon, 13 Feb 2017 06:51:52 -0800 (PST)
Subject: [Buildroot] Shell scripts does not emit finished() to QProcess
Message-ID: <1486997512738-156891.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys,
Since I updated to 2016.11 i don?t get any exit messages from shell scripts
when i execute them from my Qt Programm via QProcess. But the scripts has
been executed.

Also
process->waitForFinished(); 
does only wait its default 30000msecs.

In my test script i am only have on mkdir like:

#!/bin/sh
mkdir /usr/test
exit 0
 
I am also connected to errorOccurred(), but i don?t get any errors. 

When i am testing my code on my arch desktop everything works fine.

Does anyone have the same problem?
Or can anyone test this at the newest buildroot version?
I would be very grateful for helping.

Greetings
Logi




--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Shell-scripts-does-not-emit-finished-to-QProcess-tp156891.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.

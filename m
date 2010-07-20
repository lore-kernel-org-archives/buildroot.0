From: JNY <jny0@hotmail.com>
Date: Tue, 20 Jul 2010 03:34:10 -0700 (PDT)
Subject: [Buildroot]  App won't run on target machine
Message-ID: <29213471.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,
I have an embedded linux system which is loaded from a bootable USB.
The kernel was built using Buildroot.  When configuring Buildroot, an
app is built at the same time.  When this app is run, it works fine.
I've recently noticed a few bugs in the app, and have therefore
recompiled the code (with said bugs rectified), but now the app won't
run.  As an experiment I wrote another app called test which would
print text to the screen, and this won't run either.  Is it necessary
for me to rebuild from Buildroot every time I want to fix a bug?  I
would have thought that as long as the recompilation is done on a
Linux system, it should work on another.  Both apps are written in c,
and the test app only uses stdio.h.
Regards, 
-- 
View this message in context: http://old.nabble.com/App-won%27t-run-on-target-machine-tp29213471p29213471.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.

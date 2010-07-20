From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 Jul 2010 13:06:32 +0200
Subject: [Buildroot] App won't run on target machine
In-Reply-To: <29213471.post@talk.nabble.com> (JNY's message of "Tue, 20 Jul
	2010 03:34:10 -0700 (PDT)")
References: <29213471.post@talk.nabble.com>
Message-ID: <877hkqjttz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "JNY" == JNY  <jny0@hotmail.com> writes:

 JNY> Hi,
 JNY> I have an embedded linux system which is loaded from a bootable USB.
 JNY> The kernel was built using Buildroot.  When configuring Buildroot, an
 JNY> app is built at the same time.  When this app is run, it works fine.
 JNY> I've recently noticed a few bugs in the app, and have therefore
 JNY> recompiled the code (with said bugs rectified), but now the app won't
 JNY> run.  As an experiment I wrote another app called test which would
 JNY> print text to the screen, and this won't run either.  Is it necessary
 JNY> for me to rebuild from Buildroot every time I want to fix a bug?  I
 JNY> would have thought that as long as the recompilation is done on a
 JNY> Linux system, it should work on another.  Both apps are written in c,
 JNY> and the test app only uses stdio.h.

You are using the buildroot cross compiler to recompile, right?

-- 
Bye, Peter Korsgaard

From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 Feb 2012 10:01:28 +0100
Subject: [Buildroot] Buildroot RFS Login Question
In-Reply-To: <CB561DC5.2E86%donald.poole@swri.org> (Donald R. Poole's message
 of "Tue, 7 Feb 2012 06:31:46 +0000")
References: <CB561DC5.2E86%donald.poole@swri.org>
Message-ID: <87aa4vt3tj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Donald" == Poole, Donald R <drpoole@swri.org> writes:

 >> puts("Login incorrect");
 >> 
 >> As you're using the default fs skeleton, the pw_passwd[0] and
 >> /etc/securetty tests shouldn't fail, but apparently they do. Could you
 >> enable strace and run
 >> 
 >> strace -f login
 >> 
 >> And send the output to the list?
 >> 
 >> -- 
 >> Bye, Peter Korsgaard

 Donald> Ok, sorry for the delay, but I was tied up at work getting ready for a
 Donald> demo.  But, here is the strace output?it's quite long:

 Donald> 1292  execve("bin/login", ["bin/login"], [/* 8 vars */]) = 0

I don't see "Login incorrect" anywhere in that log. Did you remember to
use strace -f ?

-- 
Bye, Peter Korsgaard

From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 10 Feb 2012 11:44:48 +0100
Subject: [Buildroot] simple question about dropbear
In-Reply-To: <853BA8D0-AD4E-4B14-A9E7-EC9908AE5C9A@informatik.uni-bremen.de>
 (Johannes Teiwes's message of "Fri, 10 Feb 2012 10:01:47 +0100")
References: <853BA8D0-AD4E-4B14-A9E7-EC9908AE5C9A@informatik.uni-bremen.de>
Message-ID: <871uq32cin.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Johannes" == Johannes Teiwes <jteiwes@informatik.uni-bremen.de> writes:

 Johannes> Good morning!

 Johannes> I have dropbear configured to run on my target system. The
 Johannes> deamon process shows up in the process list. But as soon as i
 Johannes> connect from the outside via ssh the spawned dropbear process
 Johannes> takes up 100% cpu and never releases is, even when the
 Johannes> external connection request gets canceled.  I have tried to
 Johannes> use the generated rsa/dss keys, login as a regular user (non
 Johannes> root) but its not changing anything.  Have i overlooked
 Johannes> something? Does dropbear has a config like the openssh module
 Johannes> which can forbid (root-)login per default?

It works fine here. Could you enable strace and use it to see what the
dropbear process is doing?

-- 
Bye, Peter Korsgaard

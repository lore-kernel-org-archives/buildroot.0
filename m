From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 May 2011 19:44:56 +0200
Subject: [Buildroot] location of mysql in menuconfig
In-Reply-To: <20110501080516.12020qo05ngsramo@www.home.zuerker.org> (Heiko
	Zuerker's message of "Sun, 01 May 2011 08:05:16 -0500")
References: <20110501080516.12020qo05ngsramo@www.home.zuerker.org>
Message-ID: <87iptuuxgn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Heiko" == Heiko Zuerker <heiko@zuerker.org> writes:

 Heiko> Hey,
 Heiko> mysql is currently located under libraries/database in menuconfig.
 Heiko> Should we move it to a different location before I submit the mysql
 Heiko> server patch?
 Heiko> If yes, what would be the best choice?

We don't really have a good spot for it - We could either put it under
Network (as you can use it over network) or under Miscellaneous.

-- 
Bye, Peter Korsgaard

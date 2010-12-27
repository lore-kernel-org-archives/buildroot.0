From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 Dec 2010 16:28:12 +0100
Subject: [Buildroot] busybox, hardcoded config
In-Reply-To: <20101226080847.93616g8dqnq63ew4@www.home.zuerker.org> (Heiko
	Zuerker's message of "Sun, 26 Dec 2010 08:08:47 -0600")
References: <20101223073318.154656bz82tuap44@www.home.zuerker.org>
	<20101224085246.0a2d8640@surf>
	<20101224072947.17101by6ka661utc@www.home.zuerker.org>
	<87ipyhpl2b.fsf@macbook.be.48ers.dk>
	<20101226080847.93616g8dqnq63ew4@www.home.zuerker.org>
Message-ID: <87tyhznskz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Heiko" == Heiko Zuerker <heiko@zuerker.org> writes:

Hi,

 Heiko> It wouldn't be possible too just compile busybox with uclibc and the
 Heiko> rest of the apps with glibc, correct?

Why not? As long as you are linking statically it doesn't matter what C
library the rest of the system is using.

 Heiko> I could rewrite the initramfs support to work with shared libs. All it
 Heiko> takes is a little routine to find all the required libraries and copy
 Heiko> them over. I'll take a look at this later today.

Ok, great.

-- 
Bye, Peter Korsgaard

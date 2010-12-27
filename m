From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 Dec 2010 16:46:37 +0100
Subject: [Buildroot] busybox, hardcoded config
In-Reply-To: <20101227093446.1392541i0cof9es6@www.home.zuerker.org> (Heiko
	Zuerker's message of "Mon, 27 Dec 2010 09:34:46 -0600")
References: <20101223073318.154656bz82tuap44@www.home.zuerker.org>
	<20101224085246.0a2d8640@surf>
	<20101224072947.17101by6ka661utc@www.home.zuerker.org>
	<87ipyhpl2b.fsf@macbook.be.48ers.dk>
	<20101226080847.93616g8dqnq63ew4@www.home.zuerker.org>
	<87tyhznskz.fsf@macbook.be.48ers.dk>
	<20101227093446.1392541i0cof9es6@www.home.zuerker.org>
Message-ID: <87pqsnnrqa.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Heiko" == Heiko Zuerker <heiko@zuerker.org> writes:

Hi,

 >> Why not? As long as you are linking statically it doesn't matter
 >> what C library the rest of the system is using.

 Heiko> I didn't phrase my question right: does buildroot support it?
 Heiko> End-state I need to be able to just run "make" and everything is being
 Heiko> build without any interaction.

You are only using buildroot for the initramfs, right? If so, yes that
works.

 Heiko> Obviously I didn't get a chance to look into it. My house decided it
 Heiko> wanted me to fix leaking water valves...

Priorities, priorities ;)

-- 
Bye, Peter Korsgaard

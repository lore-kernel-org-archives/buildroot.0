From: Heiko Zuerker <heiko@zuerker.org>
Date: Mon, 27 Dec 2010 09:34:46 -0600
Subject: [Buildroot] busybox, hardcoded config
In-Reply-To: <87tyhznskz.fsf@macbook.be.48ers.dk>
References: <20101223073318.154656bz82tuap44@www.home.zuerker.org>
	<20101224085246.0a2d8640@surf>
	<20101224072947.17101by6ka661utc@www.home.zuerker.org>
	<87ipyhpl2b.fsf@macbook.be.48ers.dk>
	<20101226080847.93616g8dqnq63ew4@www.home.zuerker.org>
	<87tyhznskz.fsf@macbook.be.48ers.dk>
Message-ID: <20101227093446.1392541i0cof9es6@www.home.zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quoting Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Heiko" == Heiko Zuerker <heiko@zuerker.org> writes:
>
> Hi,
>
>  Heiko> It wouldn't be possible too just compile busybox with uclibc and the
>  Heiko> rest of the apps with glibc, correct?
>
> Why not? As long as you are linking statically it doesn't matter what C
> library the rest of the system is using.

I didn't phrase my question right: does buildroot support it?
End-state I need to be able to just run "make" and everything is being  
build without any interaction.
I assume it's probably a lot easier to just use shared libs.

>  Heiko> I could rewrite the initramfs support to work with shared  
> libs. All it
>  Heiko> takes is a little routine to find all the required libraries and copy
>  Heiko> them over. I'll take a look at this later today.
>
> Ok, great.

Obviously I didn't get a chance to look into it. My house decided it  
wanted me to fix leaking water valves...

-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org


----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.

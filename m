From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 20 Dec 2009 18:52:26 +0100
Subject: [Buildroot] develop using buildroot
In-Reply-To: <200912201705.12045.korgull@home.nl> (Marcel's message of "Sun,
	20 Dec 2009 17:05:11 +0100")
References: <200912201506.20584.korgull@home.nl>
	<2daf59620912200746q71473c64r16ce13b9ef7e197c@mail.gmail.com>
	<200912201705.12045.korgull@home.nl>
Message-ID: <87tyvl1qjp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marcel" == Marcel  <korgull@home.nl> writes:

 Marcel> Hi Hedwin,
 Marcel> That's exactly how I work now. 

 Marcel> I am just going through the pains of getting my initial environment to work 
 Marcel> but I'm almost there I think.
 Marcel> u-boot, kernel and most packages build fine, just the rootfs misses some items 
 Marcel> like /root/etc/passwd. I guess I forgot something along the way.

That one comes from your target skeleton, see
target/generic/target_skeleton for an example.

-- 
Bye, Peter Korsgaard

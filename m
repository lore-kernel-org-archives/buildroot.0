From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 05 Jul 2013 09:15:41 +0200
Subject: [Buildroot] [git commit] gcc: common definitions
In-Reply-To: <51D5B60C.2010603@mind.be> (Arnout Vandecappelle's message of
 "Thu, 04 Jul 2013 19:51:08 +0200")
References: <20130704095649.AD5849A29F@busybox.osuosl.org>
 <51D5B60C.2010603@mind.be>
Message-ID: <8761wplboi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout> On 07/03/13 22:58, Peter Korsgaard wrote:
 >> commit: http://git.buildroot.net/buildroot/commit/?id=f198318fa564bead33bb0e389ddae1f5cbec0b6c
 >> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
 >> 
 >> +choice
 >> +	prompt "GCC compiler Version"
 >> +	default BR2_GCC_VERSION_4_4_X if BR2_sparc_sparchfleon || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleon || BR2_sparc_sparcsfleonv8
 >> +	default BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 if BR2_avr3

 Arnout>  avr3?

Good catch - Fixed, thanks.

-- 
Bye, Peter Korsgaard

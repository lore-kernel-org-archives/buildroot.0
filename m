From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 31 May 2016 17:42:22 +0200
Subject: [Buildroot] [PATCH 1/1] gcc/libmudflap: also unavailable for
	gcc 6.x
In-Reply-To: <fbf3f11b-79d9-7b4a-f80a-8ecc62a8dd26@mind.be> (Arnout
 Vandecappelle's message of "Mon, 30 May 2016 23:38:38 +0200")
References: <1464462116-28780-1-git-send-email-bernd.kuhls@t-online.de>
 <fbf3f11b-79d9-7b4a-f80a-8ecc62a8dd26@mind.be>
Message-ID: <87k2iaxmht.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >  Since 4.7 is deprecated and 4.8 will in a year or so, perhaps it's time to
 > replace this with

 > 	depends on BR2_GCC_VERSION_4_7_X || BR2_GCC_VERSION_4_8_X

 >  Or even better

 > 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9

 >  That said, this patch does the trick and we want this in 2016.05, so

Agreed, care to send a patch for next?

-- 
Bye, Peter Korsgaard

From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Nov 2012 09:32:47 +0100
Subject: [Buildroot] [PATCH] mxs-bootloader: Barebox entry point symbol
	changed in 2012.08
In-Reply-To: <50A745D3.2050804@free-electrons.com> (Maxime Ripard's message of
 "Sat, 17 Nov 2012 09:07:47 +0100")
References: <1350547326-31407-1-git-send-email-maxime.ripard@free-electrons.com>
 <50A745D3.2050804@free-electrons.com>
Message-ID: <87zk2gvdcg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:


 >> load barebox;
 >> -        load ivt (entry = barebox:exception_vectors) > 0x8000;
 >> +        load ivt (entry = barebox:start) > 0x8000;
 >> hab call 0x8000;
 >> 
 >> }

 Maxime> Can we apply this patch now that all supported barebox versions have
 Maxime> this entry point ?

Yes, will do so now. Thanks for reminding me.

-- 
Bye, Peter Korsgaard

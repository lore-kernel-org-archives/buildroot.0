From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 18 Nov 2009 09:57:43 +0100
Subject: [Buildroot] [PATCH] Add support for the Cortex-A8 processor
In-Reply-To: <200911171712.55522.minimod@morethan.org> (Michael S. Zick's
	message of "Tue\, 17 Nov 2009 17\:12\:53 -0600")
References: <200911171712.55522.minimod@morethan.org>
Message-ID: <87y6m4us54.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:

Hi,

 Michael> Just a FYI - yesterday learned, the hard way (I.E: before
 Michael> reading the release notes):

 Michael> There was an ABI change from gcc-4.3 to gcc-4.4 for
 Michael> MIPS/MIPSel There are a lot of things affected, I gave up on
 Michael> that and switched back to 4.3.whatever

Yes, there's still some issues with 4.4.x, that's why we still default
to 4.3.4.

-- 
Bye, Peter Korsgaard

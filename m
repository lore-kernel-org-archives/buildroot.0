From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Mar 2017 23:04:26 +0100
Subject: [Buildroot] [PATCH] support/script/check-bin-arch: ignore
	/usr/share
In-Reply-To: <87efxpj8bv.fsf@dell.be.48ers.dk>
References: <1490128516-31437-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87inn1k9bb.fsf@dell.be.48ers.dk>
 <20170322140639.5c8c5149@free-electrons.com>
 <87efxpj8bv.fsf@dell.be.48ers.dk>
Message-ID: <20170322230426.076a8048@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Mar 2017 22:43:48 +0100, Peter Korsgaard wrote:

> Exactly, or alternatively we run readelf on a host utility (E.G. HOSTCC)
> to detect the machine string.

Indeed.

>  > I must say I still like the fact that we detect sparc vs. sparcv9,
>  > arcompat vs arcv2. I.e why do we have some binaries that have a
>  > different machine number than most of the binaries being produced?  
> 
> Sorry, I don't know enough details about Sparc and Arc. It indeed seems
> strange.

The ARC is resolved. I'll look into the SPARC one.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

From: ing. Federico Fuga <fuga@studiofuga.com>
Date: Tue, 04 Dec 2007 19:53:53 +0100
Subject: [Buildroot] Undefined instruction on PXA270
In-Reply-To: <20071202223110.GA22365@buzzloop.caiaq.de>
References: <20071121233524.GB11890@buzzloop.caiaq.de>
	<474556AE.8060209@studiofuga.com>
	<20071202223110.GA22365@buzzloop.caiaq.de>
Message-ID: <4755A241.9010902@studiofuga.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Daniel,

Daniel Mack ha scritto:
> Do you have the DOPIC config option set in uClibc?
>   

yes, I have it:
> grep DOPIC local/freescan/*
local/freescan/uclibc-0.9.29.config:DOPIC=y

> However, this option is set by default so I really wonder why nobody
> else runs into this issue than me?
>
> Maybe anybody with more in-depth knowledge about what actually happens
> with PIC-only in conjunction with (PLT) assembly could enlighten me, I'd
> appreciate that :)
>   

I suggest to start from a very-basic configuration (default with only
kernel patches for emx270) then see if that works. Check-out the latest
busybox sources, and put the patches not yet included.

Good luck :)

From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 04 Nov 2013 08:03:46 +0100
Subject: [Buildroot] Patchwork oldest patches cleanup #2 (deadline
	November 17)
In-Reply-To: <CAAXf6LV_kM18mt8h5yQScnhOPfJZ2PMNg3tvF=mBLCi8bFem2A@mail.gmail.com>
References: <CAAXf6LV_kM18mt8h5yQScnhOPfJZ2PMNg3tvF=mBLCi8bFem2A@mail.gmail.com>
Message-ID: <527746D2.5000802@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/11/13 16:09, Thomas De Schampheleire wrote:
[snip]
> linux: add default defconfig
> Arnout Vandecappelle <arnout@mind.be>
> http://patchwork.ozlabs.org/patch/181185

  This one didn't receive positive feedback, so I guess it's rejected. 
Short recap: it allows you to build the kernel with the architecture's 
default defconfig, which is typically a bloaty configuration that 
supports many boards (if an appropriate device tree is present). IIRC the 
feedback was that this wasn't usually appropriate for buildroot use cases.


[snip]
> [RFC] patches-from-git.sh: new support script
> Arnout Vandecappelle <arnout@mind.be>
> http://patchwork.ozlabs.org/patch/182856

  This one can definitely be rejected, since it was RFC and didn't 
receive comments AFAICR.

  Note: I'd to the rejects myself but as usual I'm reading this without 
internet access.

  Regards,
  Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

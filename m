From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Jun 2019 13:07:21 +0200
Subject: [Buildroot] [PATCH v3] mfgtools: bump revision to latest uuu
 version
In-Reply-To: <1f9e1d82-380b-bc03-475f-5c3283ac7f7e@mind.be>
References: <20190608105337.19879-1-bisson.gary@gmail.com>
 <cfe0721d-fbce-bb84-cf59-6353d7348ab8@mind.be>
 <20190611081559.GA24465@t450s.lan>
 <1f9e1d82-380b-bc03-475f-5c3283ac7f7e@mind.be>
Message-ID: <20190611130721.02cb7cd2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 11 Jun 2019 11:52:31 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>  Maybe first Peter and Thomas can confirm that this is the right approach?
> 
>  In summary: the current version of mfgtools creates a completely different
> program called uuu that is used in a completely different way. In other words,
> existing scripts will no longer work. Because of this, my proposal is to create
> a new package for it, and move the existing mfgtools to legacy.

I agree that a new separate package is better.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

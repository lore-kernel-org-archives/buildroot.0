From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Jul 2020 18:51:13 +0200
Subject: [Buildroot] [PATCH] package/dvb-apps: add hash file
In-Reply-To: <20200708163500.GZ2273@scaer>
References: <20200704010533.1854-1-sergio.prado@e-labworks.com>
 <20200705145430.20cc4911@windsurf.home>
 <20200705173702.GI2273@scaer> <20200707122125.102c9bea@windsurf>
 <20200708163500.GZ2273@scaer>
Message-ID: <20200708185113.48a5eb16@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 8 Jul 2020 18:35:00 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > Here, since there is no hash file for dvb-apps in Buildroot in any
> > Buildroot version, we could change the tarball on sources.b.o.  
> 
> Yup. I'd like to push the v2 from Sergio shortly. Peter, will you be in
> a position to remove the archives, the one in the per-package sub-dir,m
> and the one in the main dir, once the patch is applied?

The archive can actually be dropped *now*, so that we can verify that
the new one that gets produced on the sources.b.o server has the
correct hash. This should ideally be done *before* applying Sergio's
patch.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

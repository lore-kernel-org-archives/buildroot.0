From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Aug 2018 11:18:19 +0200
Subject: [Buildroot] [PATCH v4 3/3] minicom: add license
In-Reply-To: <01b4239a-15ce-0176-11e0-9f9eee51a9fd@micronovasrl.com>
References: <89c54af3-3000-d0c5-ab7f-f6d4f4c092eb@micronovasrl.com>
 <20180826122308.90382-1-giulio.benetti@micronovasrl.com>
 <20180826122308.90382-4-giulio.benetti@micronovasrl.com>
 <01b4239a-15ce-0176-11e0-9f9eee51a9fd@micronovasrl.com>
Message-ID: <20180827111819.661a3f6f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Aug 2018 17:10:16 +0200, Giulio Benetti wrote:

> > diff --git a/package/minicom/minicom.hash b/package/minicom/minicom.hash
> > index 0e94e566e7..14998edee1 100644
> > --- a/package/minicom/minicom.hash
> > +++ b/package/minicom/minicom.hash
> > @@ -1,2 +1,3 @@
> >   # Locally calculated
> >   sha256 3bd58b594ac66545649c13ab2b728a4df0f78612eb030680d4152f7627d1f177  minicom-19ab49422f3431102c31fea01549121385113f80.tar.gz
> > +sha256 cf80a758014eefbf068afffe3d462fc34ff4f528527524d8e100329c42094e15  COPYING
> > \ No newline at end of file  
> 
> I've just realized this breaks make legal-info.
> Do I need to resend patchset as v5?

Could you resend with the following order:

 1. Add hash file
 2. Add license information
 3. Bump to new Git version

This way, we can apply (1) and (2) to the master branch, and (3) to the
next branch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

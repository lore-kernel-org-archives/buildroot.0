From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Feb 2018 22:45:00 +0100
Subject: [Buildroot] patchwork.ozlabs.org down, and e-mails not recorded
In-Reply-To: <20180108091044.1141f540@windsurf>
References: <20180105214340.6f0cc1f7@windsurf>
 <ced2aeb2-82f6-c836-dd5a-e65c6b49c81a@au1.ibm.com>
 <20180108091044.1141f540@windsurf>
Message-ID: <20180205224500.1a34e02a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 8 Jan 2018 09:10:44 +0100, Thomas Petazzoni wrote:

> > Hmm, looking at the patch list, I also see that patch 2/3 in that series 
> > (https://patchwork.ozlabs.org/patch/852063/) wasn't correctly identified 
> > in the same series as patch 1 
> > (https://patchwork.ozlabs.org/patch/852062/) which is a bit weird.  
> 
> Note: this issue happened again yesterday. In this series of 4 patches:
> 
>   http://lists.busybox.net/pipermail/buildroot/2018-January/210935.html
> 
> Only patches 2/4 and 4/4 have been recorded by patchwork:
> 
>   https://patchwork.ozlabs.org/patch/856422/
>   https://patchwork.ozlabs.org/patch/856423/

This is still happening, and pretty badly. Sometimes almost entire
series are skipped. Most recent example is this series:

  http://lists.busybox.net/pipermail/buildroot/2018-February/213111.html

It has 15 patches and a cover letter, and all what patchwork recorded
is:

  https://patchwork.ozlabs.org/patch/869198/
  https://patchwork.ozlabs.org/patch/869197/

Only two patches out of 15 + a cover letter. Not great.

Is there anything that can be done about this ? An example of
Message-Id that was not recorded is:

 Message-Id: <8027bae45d8e041c8a1e0bc714ab378ff984ded3.1517820133.git.yann.morin.1998@free.fr>

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com

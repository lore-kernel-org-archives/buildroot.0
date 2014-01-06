From: Matthew Weber <mlweber1@rockwellcollins.com>
Date: Mon, 6 Jan 2014 07:45:29 -0600
Subject: [Buildroot] Patchwork oldest patches cleanup #5 (deadline
	January	19)
In-Reply-To: <CAAXf6LVcK-fx059K=tetV=NY78amOHczPkbVxkO1pKAuvDCwtA@mail.gmail.com>
References: <CAAXf6LVcK-fx059K=tetV=NY78amOHczPkbVxkO1pKAuvDCwtA@mail.gmail.com>
Message-ID: <OF2BF2EC5E.5C8C5827-ON86257C58.004A99B8-86257C58.004B936D@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

buildroot-bounces at busybox.net wrote on 01/05/2014 10:01:56 AM:

> From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> To: buildroot <buildroot@busybox.net>, Matt Weber 
> <rc.lsw.collaborate@gmail.com>, Jean-Christophe PLAGNIOL-VILLARD 
> <plagnioj@jcrosoft.com>, Jon Diekema <jon.diekema@gmail.com>, Marek 
> Belisko <marek.belisko@open-nandra.com>, Floris Bos <bos@je-eigen-
> domein.nl>, Sagaert Johan <sagaert.johan@skynet.be>, Stefan Fr?berg 
> <stefan.froberg@petroprogram.com>
> Date: 01/05/2014 10:02 AM
> Subject: [Buildroot] Patchwork oldest patches cleanup #5 (deadline 
January 19)
> Sent by: buildroot-bounces at busybox.net
> 
<snip>
 
> [1/2] new package: python-posix_ipc.
> Matt Weber <rc.lsw.collaborate@gmail.com>
> http://patchwork.ozlabs.org/patch/212498
> 
> [2/2] new package: python-posix_ipc
> Matt Weber <rc.lsw.collaborate@gmail.com>
> http://patchwork.ozlabs.org/patch/212499

Still need this one.  I'll get is updated with the new python pkg hooks
and submit a v2.

> 
> [1/1] added python unicode selection to menu
> Matt Weber <rc.lsw.collaborate@gmail.com>
> http://patchwork.ozlabs.org/patch/212500
> 

The default unicode mode of a python build is ucs4.  This patch adds the
option to select ucs2 or 4 if the unicode mode is enabled.  I'll refresh 
this one and submit v2.

From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 23 Oct 2019 08:25:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d-headers: fix install of
 dri.pc
References: <20191012173011.11419-1-bernd.kuhls@t-online.de>
 <20191022230239.5de5d75b@windsurf>
Message-ID: <sa858gx347.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 22 Oct 2019 23:02:39 +0200 schrieb Thomas Petazzoni:

> Could you give more details about the situation you've encountered where
> dri.pc was missing, and that let you to propose this patch ?

Hi,

dri.pc is needed by xserver_xorg-server, sent new series:
http://patchwork.ozlabs.org/project/buildroot/list/?series=137951

Regards, Bernd

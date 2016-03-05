From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 05 Mar 2016 18:43:54 +0100
Subject: [Buildroot] [PATCH/next 30/31] package/vsxu: new package
References: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
 <1456006176-21308-31-git-send-email-bernd.kuhls@t-online.de>
 <20160305161552.36cc6677@free-electrons.com>
Message-ID: <qfirqcxc1s.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Sat, 05 Mar 2016 16:15:52 +0100 schrieb Thomas Petazzoni:

>> +VSXU_VERSION = 4a34b08ec9e51605ca55d1a833f23e9601b2aa88 +VSXU_SITE =
>> $(call github,vovoid,vsxu,$(VSXU_VERSION))
>> +VSXU_CAL3D_VERSION = 0f640189eec913973c64db3bc1c1685554cb7202
>> +VSXU_CAL3D_SOURCE = cal3d-$(VSXU_CAL3D_VERSION).tar.gz
>> +VSXU_EXTRA_DOWNLOADS = $(call
>> github,vovoid,cal3d,$(VSXU_CAL3D_VERSION))/$(VSXU_CAL3D_SOURCE)
> 
> cal3d is a project of its own, available on its own website
> (http://home.gna.org/cal3d/). I would very much prefer to create
> package/cal3d/ with the upstream cal3d version rather than using this
> submodule solution.

the first iteration of my patch series contained a pseudo cal3d package:
http://patchwork.ozlabs.org/patch/541356/

The current code replacing this pseudo cal3d package which you quoted, 
and rejected now, was written by you ;)
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/135191

I understand that there is no good solution for projects using git 
submodules in buildroot atm but I would like to know which way of 
handling them is prefered so I can send a proper patch ;)

Regards, Bernd

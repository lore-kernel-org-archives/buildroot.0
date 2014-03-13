From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Thu, 13 Mar 2014 22:06:39 +0100
Subject: [Buildroot] [PATCH v6 2/5] mesa3d: modularize and bump to
	version 10.0.4
References: <1394653353-10904-1-git-send-email-berndkuhls@hotmail.com>
 <BLU0-SMTP225D817D6365614C1517D91D9760@phx.gbl>
 <5322075D.20206@savoirfairelinux.com>
Message-ID: <v7j9vaxhd2.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Sebastien Bourdelin
<sebastien.bourdelin@savoirfairelinux.com>
wrote in news:5322075D.20206 at savoirfairelinux.com: 

>> +     --with-egl-platforms=$(foreach subst
>> $(space),$(comma),$(MESA3D_EGL_PLATFORMS)) 
> need quotes around the foreach for multiple selection ( example:
> --with-egl-platform='drm x11')

according to http://www.mesa3d.org/egl.html

"Its argument is a comma separated string such as --with-egl-
platforms=x11,drm."

Regards, Bernd

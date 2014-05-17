From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 17 May 2014 16:53:48 +0200
Subject: [Buildroot] [PATCH v7 29/31] xbmc: Fix ffmpeg cross compile
References: <1400326806-16428-1-git-send-email-bernd.kuhls@t-online.de>
 <1400326806-16428-30-git-send-email-bernd.kuhls@t-online.de>
 <20140517161238.40c04fc2@free-electrons.com>
Message-ID: <so9k4bxjmf.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20140517161238.40c04fc2 at free-electrons.com: 

> What is this fixing exactly? If it's needed for the bump to version
> 13.0, then it should be part of the commit doing the bump.

Hi,

ffmpeg needs to know the target arch, otherwise cross-compilation to a 
different arch fails. This info is provided by the xbmc build system.

I squashed the patch into the xbmc version bump, thanks for hint.

Regards, Bernd

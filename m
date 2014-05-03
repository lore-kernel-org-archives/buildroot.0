From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 03 May 2014 23:02:06 +0200
Subject: [Buildroot] [PATCH 3/8] mesa3d: compile fixes
References: <1398968277-9044-1-git-send-email-bernd.kuhls@t-online.de>
 <1398968277-9044-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <e32g3bxsru.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd Kuhls <bernd.kuhls@t-online.de> wrote in
news:1398968277-9044-4-git-send-email-bernd.kuhls at t-online.de: 

> Signed-off-by: Bernd Kuhls
> <bernd.kuhls@t-online.de> ---
>  package/mesa3d/mesa3d-0002-gbm-without-dri.patch |   31 ++++++++++++

Hi,

please do not apply the patch mentioned above due to
https://bugs.freedesktop.org/show_bug.cgi?id=78225#c1

I will update the mesa3d package to prevent the compile bug.

Regards, Bernd

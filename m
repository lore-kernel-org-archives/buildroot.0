From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 10 Apr 2015 19:25:00 +0200
Subject: [Buildroot] [PATCH] qt5: fix license information for
	qt5multimedia and qt5xmlpatterns
References: <1428657204-25558-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <XnsA478C5842FE37berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in
news:1428657204-25558-1-git-send-email-thomas.petazzoni at free-electrons.com:

> While most of the Qt5 components indeed seem to be under LGPLv2.1 with
> exception, or LGPLv3 or GPLv2, the qt5multimedia and qt5xmlpatterns
> components only carry the LGPLv2.1 and LGPLv3 license files, and not
> the GPLv2 license file. So one can safely assume that the GPLv2 option
> is not available for those components, and this commit adjusts the
> <pkg>_LICENSE and <pkg>_LICENSE_FILES variables accordingly.
> 
> Fixes:
> 
>   http://autobuild.buildroot.org/results/c62/c62eef5e5b8add138cdab34e6410
>   3d974d0a510b/ 
> 
> Signed-off-by: Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> 

Reviewed-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Regards, Bernd

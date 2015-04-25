From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 10:16:20 +0200
Subject: [Buildroot] [PATCH] qwt: bump to version 6.1.2
In-Reply-To: <1429901397-9961-1-git-send-email-fhunleth@troodon-software.com>
References: <1429901397-9961-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20150425101620.0e2724a4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Frank Hunleth,

On Fri, 24 Apr 2015 14:49:57 -0400, Frank Hunleth wrote:
> Qwt 6.1.2 fixes several minor issues in 6.1.0 and removes the need to
> carry a patch in Buildroot.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  package/qwt/0001-remove-installed-check.patch | 32 ---------------------------
>  package/qwt/qwt.hash                          |  2 +-
>  package/qwt/qwt.mk                            |  2 +-
>  3 files changed, 2 insertions(+), 34 deletions(-)
>  delete mode 100644 package/qwt/0001-remove-installed-check.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

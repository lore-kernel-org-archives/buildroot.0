From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Nov 2015 21:58:54 +0100
Subject: [Buildroot] [PATCH] libconfuse: bump to version 2.8
In-Reply-To: <1446742992-7041-1-git-send-email-fhunleth@troodon-software.com>
References: <1446742992-7041-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20151105215854.5e3ba55d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Frank Hunleth,

On Thu,  5 Nov 2015 12:03:12 -0500, Frank Hunleth wrote:
> Since libconfuse now has a proper release tar ball, this also adds a
> hash, removes autogen, and removes a patch that is no longer needed.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  package/libconfuse/0001-fix-configure-ac.patch | 27 --------------------------
>  package/libconfuse/libconfuse.hash             |  2 ++
>  package/libconfuse/libconfuse.mk               |  9 +++------
>  3 files changed, 5 insertions(+), 33 deletions(-)
>  delete mode 100644 package/libconfuse/0001-fix-configure-ac.patch
>  create mode 100644 package/libconfuse/libconfuse.hash

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

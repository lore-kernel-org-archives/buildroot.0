From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Dec 2017 08:21:16 +0100
Subject: [Buildroot] [PATCH 1/1] motion: bump to version 4.1.1
In-Reply-To: <20171212195250.29552-1-fontaine.fabrice@gmail.com>
References: <20171212195250.29552-1-fontaine.fabrice@gmail.com>
Message-ID: <20171213082116.0a6d7f1c@windsurf.png.is.keysight.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 12 Dec 2017 20:52:50 +0100, Fabrice Fontaine wrote:
> Remove both patches (merged in version)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-Fix-pthread_setname_np-detection.patch    | 50 ----------------
>  .../motion/0002-Check-for-pthread_getname_np.patch | 66 ----------------------
>  package/motion/motion.hash                         |  2 +-
>  package/motion/motion.mk                           |  2 +-
>  4 files changed, 2 insertions(+), 118 deletions(-)
>  delete mode 100644 package/motion/0001-Fix-pthread_setname_np-detection.patch
>  delete mode 100644 package/motion/0002-Check-for-pthread_getname_np.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Apr 2017 23:45:04 +0200
Subject: [Buildroot] [PATCH 1/3] package/libva: bump version to 1.8.0
In-Reply-To: <20170402081327.2195-1-bernd.kuhls@t-online.de>
References: <20170402081327.2195-1-bernd.kuhls@t-online.de>
Message-ID: <20170402234504.7644e61c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  2 Apr 2017 10:13:25 +0200, Bernd Kuhls wrote:
> Removed patch because libva-utils are no longer part of the libva
> package:
> https://lists.01.org/pipermail/intel-vaapi-media/2017-March/000015.html
> 
> *   Move all utilities and tests to libva-utils
> 
> Package libva-utils will be added later.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libva/0001-no_test_decode.patch | 17 -----------------
>  package/libva/libva.hash                |  4 +++-
>  package/libva/libva.mk                  | 12 +++---------
>  3 files changed, 6 insertions(+), 27 deletions(-)
>  delete mode 100644 package/libva/0001-no_test_decode.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

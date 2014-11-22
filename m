From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 20:21:02 +0100
Subject: [Buildroot] [PATCH 1/1] grantlee: version bump and allow
 building with qt5
In-Reply-To: <1415576284-18846-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
References: <1415576284-18846-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <20141122202102.47b9c845@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Zoltan Gyarmati,

On Mon, 10 Nov 2014 00:38:04 +0100, Zoltan Gyarmati wrote:
> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
> ---
>  package/grantlee/Config.in                         | 14 ++++----
>  .../grantlee-0.2.0-fix-lphread-link-error.patch    | 42 ----------------------
>  package/grantlee/grantlee.mk                       | 15 ++++++--
>  3 files changed, 20 insertions(+), 51 deletions(-)
>  delete mode 100644 package/grantlee/grantlee-0.2.0-fix-lphread-link-error.patch

Patch applied to next, thanks. I've done a test build with both qt4 and
qt5, and it worked fine for me. In the future, we'll probably want to
remove the qt4 version of grantlee, since upstream doesn't support qt4
anymore.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

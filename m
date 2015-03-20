From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 14:06:37 +0100
Subject: [Buildroot] [PATCH] package/gcc: fix ICE building QT5 on xtensa
In-Reply-To: <1426814941-25089-1-git-send-email-jcmvbkbc@gmail.com>
References: <1426814941-25089-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20150320140637.7b7ee156@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Fri, 20 Mar 2015 04:29:01 +0300, Max Filippov wrote:
> Add fix for GCC PR 64896 from the gcc-4_9-branch of gcc.
> This fixes bugzilla bug 7961.
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  package/gcc/4.9.2/110-pr64896.patch |   59 +++++++++++++++++++++++++++++++++++
>  1 files changed, 59 insertions(+), 0 deletions(-)
>  create mode 100644 package/gcc/4.9.2/110-pr64896.patch

Applied, thanks. However, this means that Qt5 will continue to fail
with the toolchain at
http://autobuild.buildroot.org/toolchains/tarballs/br-xtensa-full-2015.02.tar.bz2,
currently used by the autobuilders.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

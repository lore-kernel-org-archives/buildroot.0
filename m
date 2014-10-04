From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Oct 2014 14:42:04 +0200
Subject: [Buildroot] [PATCH 1/1] ympd: new package
In-Reply-To: <1411905842-3172-1-git-send-email-limpens@gmail.com>
References: <1411905842-3172-1-git-send-email-limpens@gmail.com>
Message-ID: <20141004144204.678bf2da@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Limpens,

On Sun, 28 Sep 2014 14:04:02 +0200, Eric Limpens wrote:
> Signed-off-by: Eric Limpens <limpens@gmail.com>
> ---
>  package/ympd/Config.in                              | 10 ++++++++++
>  .../ympd/ympd-0001-CMake-cross-compile-mkdata.patch | 15 +++++++++++++++
>  package/ympd/ympd.mk                                | 21 +++++++++++++++++++++
>  3 files changed, 46 insertions(+)
>  create mode 100644 package/ympd/Config.in
>  create mode 100644 package/ympd/ympd-0001-CMake-cross-compile-mkdata.patch
>  create mode 100644 package/ympd/ympd.mk

I've applied your patch, after making a good number of changes:

    [Thomas:
     - Add the package to package/Config.in
     - Add dependency on largefile
     - Add new patch to CMakeLists.txt to remove the unused C++
    dependency
     - Change the existing CMakeLists.txt patch to simply remove the
       problematic code, and reword the explanation.]

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

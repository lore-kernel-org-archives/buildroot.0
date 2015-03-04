From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 11:59:51 +0100
Subject: [Buildroot] [PATCH next] cmake: bump version to 3.1.3
In-Reply-To: <1424638604-8244-1-git-send-email-fabio.porcedda@gmail.com>
References: <1424638604-8244-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20150304115951.11b49369@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Sun, 22 Feb 2015 21:56:44 +0100, Fabio Porcedda wrote:
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> ---
>  package/cmake/cmake.hash | 2 +-
>  package/cmake/cmake.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

This update breaks badly in the autobuilders, see:

  http://autobuild.buildroot.org/?reason=host-cmake-3.1.3

Apparently, there is a conflict between the host installed lzma, and
the built-in lzma library of CMake.

Can you have a look ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

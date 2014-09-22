From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Sep 2014 19:08:03 +0200
Subject: [Buildroot] [PATCH v2] cmake : bump to version 3.0.2
In-Reply-To: <1411385468-24878-1-git-send-email-jeremy.rosen@openwide.fr>
References: <1411385468-24878-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <20140922190803.5af135e6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?my Rosen,

On Mon, 22 Sep 2014 13:31:07 +0200, J?r?my Rosen wrote:
> Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
> ---
>  ...not-prepend-CMake-root-path-when-searchin.patch | 38 ----------------------
>  package/cmake/cmake.mk                             |  4 +--
>  2 files changed, 2 insertions(+), 40 deletions(-)
>  delete mode 100644 package/cmake/cmake-0001-FindQt4-do-not-prepend-CMake-root-path-when-searchin.patch

Patch applied, thanks. However, there was one missing information: the
explanation of why the
cmake-0001-FindQt4-do-not-prepend-CMake-root-path-when-searchin.patch
gets removed. So I had to go check the upstream CMake Git repository to
verify that indeed a similar change had been merged. I've edited the
commit log to mention this.

See
http://git.buildroot.net/buildroot/commit/?id=4aef37b683a637c8755a8b197a46aa30674c2074.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Aug 2017 23:20:45 +0200
Subject: [Buildroot] [PATCH] dbus-cpp: fix build with gcc 7.x
In-Reply-To: <20170821220442.12240-1-thomas.petazzoni@free-electrons.com>
References: <20170821220442.12240-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170823232045.6e2299bd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Aug 2017 00:04:42 +0200, Thomas Petazzoni wrote:
> This commit adds a patch to dbus-cpp to make it build with gcc 7.x.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/07a7559c0efeeda16c239e0fa06259d4cd48c71b/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  ...3-src-pipe.c-fix-build-error-with-gcc-7.x.patch | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/dbus-cpp/0003-src-pipe.c-fix-build-error-with-gcc-7.x.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

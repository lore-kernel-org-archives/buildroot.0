From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Dec 2017 09:55:20 +0100
Subject: [Buildroot] [PATCH 1/1] vlc: fix build with libupnp above 1.6.23
In-Reply-To: <20171217115932.24429-1-fontaine.fabrice@gmail.com>
References: <20171217115932.24429-1-fontaine.fabrice@gmail.com>
Message-ID: <20171218095520.7a5d0ccb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Dec 2017 12:59:32 +0100, Fabrice Fontaine wrote:
> Backport patch already available upstream
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/d98bdcc745a2480d4664db2427f0ae1c9c5ea71e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0012-Fix-build-with-libupnp-above-1.6.23.patch | 64 ++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 package/vlc/0012-Fix-build-with-libupnp-above-1.6.23.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

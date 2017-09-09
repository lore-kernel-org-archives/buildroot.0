From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Sep 2017 22:42:40 +0200
Subject: [Buildroot] [PATCH 1/3] package/efl: fix build issue on big
 endian system
In-Reply-To: <20170907204113.14249-1-romain.naour@gmail.com>
References: <20170907204113.14249-1-romain.naour@gmail.com>
Message-ID: <20170909224240.036a5131@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  7 Sep 2017 22:41:11 +0200, Romain Naour wrote:
> Fixes:
> http://autobuild.buildroot.net/results/0f1/0f12919f59dc92a8d91e23d3b0c1120bc06720db
> http://autobuild.buildroot.net/results/62e/62e96be61601347e92f9c115209af4962fe82492
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  ...g-add-missing-header-for-big-endian-build.patch | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/efl/0001-eina_debug-add-missing-header-for-big-endian-build.patch

Series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

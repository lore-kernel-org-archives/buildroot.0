From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 19:48:34 +0200
Subject: [Buildroot] [PATCH 5/8 v11] package/xserver_xorg-server: add
 version 1.14.7
In-Reply-To: <20150426181652.621e5193@nserafini-N550JK>
References: <cover.1429635674.git.yann.morin.1998@free.fr>
 <7c1cccc2773ed740d1c418d1437c629839849f73.1429635674.git.yann.morin.1998@free.fr>
 <20150426181652.621e5193@nserafini-N550JK>
Message-ID: <20150426194834.40b9239a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nicolas Serafini,

On Sun, 26 Apr 2015 18:16:52 +0200, Nicolas Serafini wrote:

> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
> index 2c3cc5b..adf2c45 100644
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
> @@ -1,3 +1,6 @@
> +# From http://lists.x.org/archives/xorg-announce/2014-June/002440.html
> +sha1   7a95765e56b124758fcd7b609589e65b8870880b                                xorg-server-1.14.7.tar.bz2
> +sha256 fcf66fa6ad86227613d2d3e8ae13ded297e2a1e947e9060a083eaf80d323451f        xorg-server-1.14.7.tar.bz2
>  # From http://lists.x.org/archives/xorg-announce/2015-February/002530.html
>  sha1   490118810a54e91c8814245c99d6285caf4985dd                                xorg-server-1.17.1.tar.bz2
>  sha256 2bf8e9f6f0a710dec1d2472467bff1f4e247cb6dcd76eb469aafdc8a2d7db2ab        xorg-server-1.17.1.tar.bz2

Thanks, I've squashed this change into the corresponding commit.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Mar 2015 09:06:06 +0100
Subject: [Buildroot] [PATCH 08/10 v7] package/nvidia-tegra23-binaries:
 new package
In-Reply-To: <20150223124136.5fb4ea97@nserafini-N550JK>
References: <cover.1423597914.git.yann.morin.1998@free.fr>
 <af61ad6f5736862b334002ce47727c9ce3bb2ab3.1423597914.git.yann.morin.1998@free.fr>
 <20150221234636.50616706@free-electrons.com>
 <20150221225836.GB4246@free.fr>
 <20150223124136.5fb4ea97@nserafini-N550JK>
Message-ID: <20150307090606.4e1478b0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nicolas Serafini,

On Mon, 23 Feb 2015 12:41:36 +0100, Nicolas Serafini wrote:

> You right, I have only tested with an old version (1.14.7) of X.org so
> this driver won't work with the 1.17.1 version. I don't know if Nvidia
> will provide new driver with support of latest ABI version.
> Currently I have no more hardware with display to test the graphics
> part.

How were you building an old version of X.org ? By patching many
Buildroot packages ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

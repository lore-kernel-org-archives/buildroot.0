From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Aug 2017 23:29:39 +0200
Subject: [Buildroot] [PATCH/next v2 1/1] package/lzo: switch to cmake
In-Reply-To: <20170820080744.8947-1-bernd.kuhls@t-online.de>
References: <20170820080744.8947-1-bernd.kuhls@t-online.de>
Message-ID: <20170821232939.4a760c66@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 Aug 2017 10:07:44 +0200, Bernd Kuhls wrote:
> autoreconf for the host package is broken after bumping to 2.10:
> http://lists.busybox.net/pipermail/buildroot/2017-August/200634.html
> 
> To solve the problem we switch to cmake.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: patch is for next branch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

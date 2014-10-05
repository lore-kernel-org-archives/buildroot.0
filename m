From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 18:00:59 +0200
Subject: [Buildroot] [PATCH] [RFC] package/libplist: bump version
In-Reply-To: <1412515402-22348-1-git-send-email-yann.morin.1998@free.fr>
References: <1412515402-22348-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20141005180059.07e9ddab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun,  5 Oct 2014 15:23:22 +0200, Yann E. MORIN wrote:
> libplist has switched to using autotools, so remove our cmake-related
> patches.
> 
> Completely disable Python bindings:
>   - it requires cython, which we do not have packaged (so far)
>   - the only user of libplist is XBMC, which does not need the Python
>     bindings.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Samuel Martin <s.martin49@gmail.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

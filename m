From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Aug 2017 23:00:55 +0200
Subject: [Buildroot] [PATCH] package/vde2: fix build issue with gcc 7.x
In-Reply-To: <20170827220330.27544-1-romain.naour@gmail.com>
References: <20170827220330.27544-1-romain.naour@gmail.com>
Message-ID: <20170829230055.60e69b5c@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Aug 2017 00:03:30 +0200, Romain Naour wrote:
> Like for dieharder package [1], add static to inline functions.
> https://git.buildroot.net/buildroot/commit/?id=21133ada326c87627f7bdee4493d8086587c3cca
> 
> Fixes:
> http://autobuild.buildroot.net/results/ed9/ed9abb1aed2ae87971ae119f4bca83cbf9861466
> http://autobuild.buildroot.net/results/2a1/2a1f73bfaf7097d42165d5c5f6c24d1aad72c929
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  .../0002-fstp-Add-static-to-inline-functions.patch | 44 ++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 package/vde2/0002-fstp-Add-static-to-inline-functions.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

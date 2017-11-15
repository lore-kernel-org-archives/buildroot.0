From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Nov 2017 23:11:06 +0100
Subject: [Buildroot] [PATCH 1/1] libpjsip: fix ssl support
In-Reply-To: <20171114144203.8189-1-aduskett@gmail.com>
References: <20171114144203.8189-1-aduskett@gmail.com>
Message-ID: <20171115231106.0facbc02@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Nov 2017 09:42:03 -0500, Adam Duskett wrote:
> Currently, ssl support is implicitely disabled in the initial configure
> options. This overrides the check for openssl below.
> 
> libpjsip is also currently only compatible with libopenssl. Change
> the check to LIBOPENSSL instead of openssl, and depend on libopenssl.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/libpjsip/libpjsip.mk | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

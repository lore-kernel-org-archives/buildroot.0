From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Feb 2020 16:47:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/libimxvpuapi: use external waf
In-Reply-To: <20200204170132.7334-1-titouan.christophe@railnova.eu>
References: <20200204170132.7334-1-titouan.christophe@railnova.eu>
Message-ID: <20200205164757.29da8102@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  4 Feb 2020 18:01:32 +0100
Titouan Christophe <titouan.christophe@railnova.eu> wrote:

> This makes libimxvpuapi use the Waf package ditributed in Buildroot,
> instead of its own one, as the latter does not support Python3.
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> ---
>  package/libimxvpuapi/libimxvpuapi.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

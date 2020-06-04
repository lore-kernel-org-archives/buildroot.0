From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Jun 2020 23:28:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/mosquitto: bump to v1.6.10
In-Reply-To: <20200602104432.7636-1-titouan.christophe@railnova.eu>
References: <20200602104432.7636-1-titouan.christophe@railnova.eu>
Message-ID: <20200604232856.0a7a8d16@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  2 Jun 2020 12:44:32 +0200
Titouan Christophe <titouan.christophe@railnova.eu> wrote:

> This release fix some bugs in the broker and client libraries,
> as well as building with below C99 suport.
> 
> Read the whole announcement on:
> https://mosquitto.org/blog/2020/05/version-1-6-8-released/
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> ---
> (Yes, the URL is weird, but points to the 1.6.10 release)
> ---
>  package/mosquitto/mosquitto.hash | 4 ++--
>  package/mosquitto/mosquitto.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

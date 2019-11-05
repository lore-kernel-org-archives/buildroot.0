From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Nov 2019 11:09:08 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/rauc: bump to v1.2
In-Reply-To: <20191030124540.220285-1-titouan.christophe@railnova.eu>
References: <20191030124540.220285-1-titouan.christophe@railnova.eu>
Message-ID: <20191105110908.392232a1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 30 Oct 2019 13:45:40 +0100
Titouan Christophe <titouan.christophe@railnova.eu> wrote:

> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> ---
> Changes v1 -> v2: dbus is now a compile time dependency
> ---
>  package/rauc/Config.in | 2 +-
>  package/rauc/rauc.hash | 4 ++--
>  package/rauc/rauc.mk   | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

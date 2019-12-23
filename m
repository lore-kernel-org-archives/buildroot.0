From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Dec 2019 21:03:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/samba4: remove trailing space
 in samba4.mk
In-Reply-To: <20191223104801.50165-1-titouan.christophe@railnova.eu>
References: <20191223104801.50165-1-titouan.christophe@railnova.eu>
Message-ID: <20191223210331.173dd45f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Dec 2019 11:48:01 +0100
Titouan Christophe <titouan.christophe@railnova.eu> wrote:

> This fixes the following warning from `make check-package`:
>     package/samba4/samba4.mk:34: line contains trailing whitespace
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> ---
>  package/samba4/samba4.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

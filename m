From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Apr 2021 22:51:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/librsync: bump to version 2.3.2
In-Reply-To: <20210412161700.1151306-1-fontaine.fabrice@gmail.com>
References: <20210412161700.1151306-1-fontaine.fabrice@gmail.com>
Message-ID: <20210421225129.4b44f91d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 12 Apr 2021 18:17:00 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This is a patch release that fixes some minor bugs, tidies the code for
> many compiler warnings, and improves windows compatibility. Upgrading
> from v2.3.1 is recommended for most people, and essential for people
> using platforms experiencing bugs #214 or #207.
> 
> https://github.com/librsync/librsync/releases/tag/v2.3.2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/librsync/librsync.hash | 2 +-
>  package/librsync/librsync.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

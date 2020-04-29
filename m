From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Apr 2020 22:11:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: security bump version
 to 4.11.8
In-Reply-To: <20200429172904.973038-1-bernd.kuhls@t-online.de>
References: <20200429172904.973038-1-bernd.kuhls@t-online.de>
Message-ID: <20200429221131.730c232e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 29 Apr 2020 19:29:04 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Reformatted hash.
> 
> Fixes CVE 2020-10700 & CVE 2020-10704.
> 
> Release notes: https://www.samba.org/samba/history/samba-4.11.8.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/samba4/samba4.hash | 6 +++---
>  package/samba4/samba4.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

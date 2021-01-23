From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 22:05:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/libtorrent-rasterbar: drop host
 gcc dependency
In-Reply-To: <20210106065854.283992-1-fontaine.fabrice@gmail.com>
References: <20210106065854.283992-1-fontaine.fabrice@gmail.com>
Message-ID: <20210123220519.758ae4c3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  6 Jan 2021 07:58:54 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop host gcc dependency which has wrongly been added by commit
> 0393f5d34433e34e49ff7ce0fb998735453ed4fc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libtorrent-rasterbar/Config.in | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Applied to master, thanks. Impressive that this has been in the tree
for several years, without anybody noticing.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

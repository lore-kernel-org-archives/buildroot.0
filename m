From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 10:59:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/gdb: allow building against
 python3 for host-gdb
In-Reply-To: <20200409114638.16432-1-angelos@igalia.com>
References: <20200409114638.16432-1-angelos@igalia.com>
Message-ID: <20200411105957.33d4b42d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  9 Apr 2020 13:46:38 +0200
Angelos Oikonomopoulos <angelos@igalia.com> wrote:

> Some gdb extensions require python3, so this simply adds a
> configuration option to point the host GDB at python3.
> 
> Signed-off-by: Angelos Oikonomopoulos <angelos@igalia.com>
> ---
>  package/gdb/Config.in.host | 14 ++++++++++++++
>  package/gdb/gdb.mk         |  7 +++++++
>  2 files changed, 21 insertions(+)

Thanks a lot Angelos for your contribution. However, we already have a
similar patch in our backlog of patches to review and merge:

  http://patchwork.ozlabs.org/patch/1259866/

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

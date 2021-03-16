From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 21:23:24 +0100
Subject: [Buildroot] [PATCH v1] package/pcre2: bump version to 10.36
In-Reply-To: <20210315204845.11464-1-ps.report@gmx.net>
References: <20210315204845.11464-1-ps.report@gmx.net>
Message-ID: <20210316212324.22d31ef3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Mar 2021 21:48:45 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> - removed 0001-Use-the-standard-code-path-of-sljit_emit_cmov-on-mips-r6.patch
>   (upstream [1])
> 
> - license file hash update (email update for Philip Hazel)
> 
> [1] https://vcs.pcre.org/pcre2?view=revision&revision=1281
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...e-path-of-sljit_emit_cmov-on-mips-r6.patch | 59 -------------------
>  package/pcre2/pcre2.hash                      |  7 ++-
>  package/pcre2/pcre2.mk                        |  2 +-
>  3 files changed, 5 insertions(+), 63 deletions(-)
>  delete mode 100644 package/pcre2/0001-Use-the-standard-code-path-of-sljit_emit_cmov-on-mips-r6.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

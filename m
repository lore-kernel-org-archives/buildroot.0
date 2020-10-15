From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 22:57:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/oniguruma: fix CVE-2020-26159
In-Reply-To: <20201015170253.968250-1-fontaine.fabrice@gmail.com>
References: <20201015170253.968250-1-fontaine.fabrice@gmail.com>
Message-ID: <20201015225706.62449355@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 15 Oct 2020 19:02:53 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix CVE-2020-26159: In Oniguruma 6.9.5_rev1, an attacker able to supply
> a regular expression for compilation may be able to overflow a buffer by
> one byte in concat_opt_exact_str in src/regcomp.c.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-207-Out-of-bounds-write.patch        | 25 +++++++++++++++++++
>  package/oniguruma/oniguruma.mk                |  3 +++
>  2 files changed, 28 insertions(+)
>  create mode 100644 package/oniguruma/0001-207-Out-of-bounds-write.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

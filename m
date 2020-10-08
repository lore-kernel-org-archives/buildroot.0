From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Oct 2020 23:28:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/botan: update architectures
In-Reply-To: <20201008200611.548512-1-fontaine.fabrice@gmail.com>
References: <20201008200611.548512-1-fontaine.fabrice@gmail.com>
Message-ID: <20201008232833.26022d19@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  8 Oct 2020 22:06:11 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - aarch64, powerpc64le and s390x are supported since version 2.5.0 and
>   https://github.com/randombit/botan/commit/5f55f0eac95cd6f1c2962aef261af285bf37bfb6
> - sparc64 is supported since version 2.5.0 and
>   https://github.com/randombit/botan/commit/7e6aea7a9bff0714756aff5c7470c5c55cb31e0c
> - riscv is supported since version 2.8.0 and
>   https://github.com/randombit/botan/commit/b9aafd67002be96bf00eea4e7791804693ba4b1f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/botan/Config.in | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

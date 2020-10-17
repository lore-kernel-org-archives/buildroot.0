From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Oct 2020 14:45:17 +0200
Subject: [Buildroot] [PATCH 1/1] support/scripts/apply-patches.sh:
 manage uncompression
In-Reply-To: <20200520193045.92597-1-fontaine.fabrice@gmail.com>
References: <20200520193045.92597-1-fontaine.fabrice@gmail.com>
Message-ID: <20201017144517.7a0560c0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 20 May 2020 21:30:45 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Extract from bug report:
> 
> "Code line 120 to line 128 is to check whether the patch containing
> "rename from" and "rename to". But it directly use grep to find,
> ignoring the patch may be a tar file or else. It can only work on patch
> of textfile form."
> 
> Fixes:
>  - https://bugs.buildroot.org/show_bug.cgi?id=11931
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  support/scripts/apply-patches.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

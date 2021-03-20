From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 22:15:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/jasper: bump version to 2.0.27
In-Reply-To: <20210318113327.829-1-jubalh@iodoru.org>
References: <20210318113327.829-1-jubalh@iodoru.org>
Message-ID: <20210320221521.73fbd8b6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 18 Mar 2021 12:33:27 +0100
Michael Vetter <jubalh@iodoru.org> wrote:

> Changes:
>   * Check for an image containing no samples in the PGX
>     decoder. (#271, #272, #273, #274, #275, #276, #281)
>   * Check for dimensions of zero in the JPC and JPEG decoders.
>   * Fix an arguably incorrect type for an integer literal
>     in the PGX decoder. (#270)
>   * Check for an invalid component reference in the
>     JP2 decoder. (#269)
>   * Check on integer size in JP2 decoder. (#278)
> 
> Signed-off-by: Michael Vetter <jubalh@iodoru.org>
> ---
>  package/jasper/jasper.hash | 2 +-
>  package/jasper/jasper.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

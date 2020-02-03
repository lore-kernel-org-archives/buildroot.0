From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 14:20:31 +0100
Subject: [Buildroot] [PATCH] package/kexec-lite: Bump version
In-Reply-To: <20200124045903.272466-1-joel@jms.id.au>
References: <20200124045903.272466-1-joel@jms.id.au>
Message-ID: <20200203142031.1e942c14@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 24 Jan 2020 15:29:03 +1030
Joel Stanley <joel@jms.id.au> wrote:

> Upstream changes include:
> 
>  - Fix loading FreeBSD kernels with multiple PT_LOAD sections.
> 
>  - Use autotools to configure and build kexec-lite
> 
>  - Add support for kexec_file_load
> 
> The packaging is adjusted to account for the change in build systems.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  package/kexec-lite/kexec-lite.hash |  2 +-
>  package/kexec-lite/kexec-lite.mk   | 13 +++----------
>  2 files changed, 4 insertions(+), 11 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

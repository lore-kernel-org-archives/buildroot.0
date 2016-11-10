From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Nov 2016 10:39:59 +0100
Subject: [Buildroot] [PATCH next] patchelf: use .tar.bz2 archive
In-Reply-To: <c3cfe7393de76448abb44e6c61a5905bdd317176.1478753638.git.baruch@tkos.co.il>
References: <c3cfe7393de76448abb44e6c61a5905bdd317176.1478753638.git.baruch@tkos.co.il>
Message-ID: <20161110103959.6b33a92d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 10 Nov 2016 06:53:58 +0200, Baruch Siach wrote:
> Saves a little space and network bandwidth.
> 
> While at it, use PATCHELF_VERSION for PATCHELF_SITE.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/patchelf/patchelf.hash | 2 +-
>  package/patchelf/patchelf.mk   | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

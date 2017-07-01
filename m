From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 00:43:40 +0200
Subject: [Buildroot] [PATCH] libzip: bump version to 1.2.0
In-Reply-To: <1498474222-16735-1-git-send-email-brgl@bgdev.pl>
References: <1498474222-16735-1-git-send-email-brgl@bgdev.pl>
Message-ID: <20170702004340.5ad811ce@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Jun 2017 12:50:22 +0200, Bartosz Golaszewski wrote:
> It's a major release, but the API seems to be mostly
> backwards-compatible. The only package depending on this library in
> buildroot is libsigrok and it builds fine.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  package/libzip/libzip.hash | 2 +-
>  package/libzip/libzip.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

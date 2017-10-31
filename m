From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Oct 2017 11:57:58 +0100
Subject: [Buildroot] [PATCH] package/cryptodev-linux: bump to the latest
 version (0a54e38)
In-Reply-To: <20171030144430.31189-1-antoine.tenart@free-electrons.com>
References: <20171030144430.31189-1-antoine.tenart@free-electrons.com>
Message-ID: <20171031115758.348c9db2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 30 Oct 2017 15:44:30 +0100, Antoine Tenart wrote:
> The build of the cryptodev-linux version used in Buildroot is currently
> broken for kernels >= 4.13. A fix was pushed upstream:
> https://github.com/cryptodev-linux/cryptodev-linux/commit/f0d69774afb27ffc62bf353465fba145e70cb85a
> 
> This patch bumps the cryptodev-linux package version to use the latest
> available one, which includes the commit fixing the build for recent
> kernels.
> 
> Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
> ---
>  package/cryptodev-linux/cryptodev-linux.hash | 2 +-
>  package/cryptodev-linux/cryptodev-linux.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

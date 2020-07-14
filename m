From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 15:24:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/haveged: bump to version 1.9.13
In-Reply-To: <1593335819-10120-1-git-send-email-pjtexier@koncepto.io>
References: <1593335819-10120-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20200714152441.2d52c033@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 28 Jun 2020 11:16:59 +0200
Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

> Changes:
> 
>  - Added support for --version
>  - Updated systemd SystemCallFilter settings
> 
> See https://github.com/jirka-h/haveged/releases/tag/v1.9.13
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  package/haveged/haveged.hash | 2 +-
>  package/haveged/haveged.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

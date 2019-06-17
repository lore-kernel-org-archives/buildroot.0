From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Jun 2019 20:27:04 +0200
Subject: [Buildroot] [PATCH 1/2] package/libsocketcan: bump to version
 0.0.11
In-Reply-To: <1560693940-10828-1-git-send-email-pjtexier@koncepto.io>
References: <1560693940-10828-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20190617202704.7fcbd70d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 16 Jun 2019 16:05:39 +0200
Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

> This includes the following changes:
> 
> 0ff01ae v0.0.11
> b217774 Add configure switch for error logging
> 15af38a Add compile option to disable error logging
> 9679a3f Add interface to retrieve link statistics
> 6f13cef Get link information only from specified interface
> f5392c3 Fix parse_rtattr() does not completely initialize
> 4ea9ec7 Update can_set_ctrlmode() documentation
> 5938ac7 Update CAN netlink header
> 0c91940 GNUmakefile: include LICENSE file in tarball
> 4608afb configure: back to trunk
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  package/libsocketcan/libsocketcan.hash | 2 +-
>  package/libsocketcan/libsocketcan.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both patches applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

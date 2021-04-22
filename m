From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 22 Apr 2021 23:49:54 +0200
Subject: [Buildroot] [PATCH] package/rcw-smarc-sal28: bump to version 11
In-Reply-To: <20210323084659.3199-1-michael@walle.cc>
References: <20210323084659.3199-1-michael@walle.cc>
Message-ID: <20210422234954.40e72bbb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 23 Mar 2021 09:46:59 +0100
Michael Walle <michael@walle.cc> wrote:

> From the changelog:
> * Enable SATA RX lane swap
> * Add workaround for A-010554 (Improve SATA hard drive detection)
> * Add workaround for A-009531 (Wrong IDO bit value for PCIe completion
>   packets)
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  package/rcw-smarc-sal28/rcw-smarc-sal28.hash | 2 +-
>  package/rcw-smarc-sal28/rcw-smarc-sal28.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

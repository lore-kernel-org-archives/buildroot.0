From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 24 Jun 2013 11:34:56 +0200
Subject: [Buildroot] [PATCHv2] linux: Fix uImage with appended DTs
	generation
In-Reply-To: <1370611303-5054-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1370611303-5054-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <20130624093456.GH26008@lukather>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 07, 2013 at 03:21:43PM +0200, Maxime Ripard wrote:
> Fixes bug #5516 - appended device tree blobs on uImage fails
> 
> Before version 3.7 of the kernel, building the zImage and then the
> uImage will rewrite the zImage in the process, removing the device tree
> we just appended.
> 
> Use mkimage to append the device tree to the uImage and rebuild the
> headers directly.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Ping?

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 836 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130624/047e5d23/attachment-0001.asc>

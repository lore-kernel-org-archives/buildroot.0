From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Oct 2018 21:47:47 +0200
Subject: [Buildroot] [PATCH v2 1/1] qt5location: copy
 PositioningQuick.so* for QtQuick
In-Reply-To: <20181016225855.GA17104@blarch>
References: <20181016225855.GA17104@blarch>
Message-ID: <20181017214747.77b04385@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 Oct 2018 00:58:55 +0200, Alexander 'z33ky' Hirsch wrote:
> The Location module for QtQuick depends on this library, which was not
> being copied in the build rule.
> 
> Signed-off-by: Alexander 'z33ky' Hirsch <1zeeky@gmail.com>
> ---
> Changes v1 -> v2:
> 	- only do the copy for latest Qt (5.11) (suggested by Peter Seiderer)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

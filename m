From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Mar 2017 15:18:14 +0100
Subject: [Buildroot] [PATCH v4] qt: add enable for truetype font
 installation
In-Reply-To: <1490331098-3269-1-git-send-email-danomimanchego123@gmail.com>
References: <1490331098-3269-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20170325151814.303fc61d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Mar 2017 00:51:38 -0400, Danomi Manchego wrote:
> Currently, qt.mk installs DejaVu/Vera TrueType fonts when Qt is configured for
> freetype support. However, some users may prefer to limit the installed fonts
> to only Qt's prerendered fonts (micro, fixed, helvetica, etc.). Or, there may
> be a preference to use seperately installed TrueType fonts. This commit adds
> a switch to explicitly control the installation of the TrueType fonts, similar
> to the existing prerendered font enables.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> Reviewed-by: Peter Seiderer <ps.report@gmx.net>
> 
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

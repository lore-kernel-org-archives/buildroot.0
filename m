From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Jun 2016 15:46:18 +0200
Subject: [Buildroot] [PATCH] bluez_utils: disable PIE for m68k
In-Reply-To: <20160622191323.GA5898@waldemar-brodkorb.de>
References: <20160622191323.GA5898@waldemar-brodkorb.de>
Message-ID: <20160625154618.420b118f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Jun 2016 21:13:23 +0200, Waldemar Brodkorb wrote:
> PIE for m68k seems broken even for non-static case.
> Fixes following kind of autobuild failures:
> http://autobuild.buildroot.net/results/5bb524a58575d57de1006ffa70be17ca713e7730/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/bluez_utils/bluez_utils.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

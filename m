From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 21:41:02 +0100
Subject: [Buildroot] [PATCH] mtd: be explicit about config options for
 the host
In-Reply-To: <20170902131905.23134-1-thomas.petazzoni@free-electrons.com>
References: <20170902131905.23134-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20171124214102.40686c0d@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Sep 2017 15:19:05 +0200, Thomas Petazzoni wrote:
> Instead of letting auto-detection do its job, be explicit about the
> fact that we want the JFFS2 and UBIFS utilities when building the host
> variant of mtd.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/mtd/mtd.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

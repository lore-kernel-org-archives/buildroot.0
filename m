From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jan 2015 18:23:11 +0100
Subject: [Buildroot] [PATCH] lightning: Add a patch to fix PPC build
 when disassembler is enabled
In-Reply-To: <1421760997-31684-1-git-send-email-paul@crapouillou.net>
References: <1421760997-31684-1-git-send-email-paul@crapouillou.net>
Message-ID: <20150125182311.5bb6017d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Paul Cercueil,

On Tue, 20 Jan 2015 14:36:37 +0100, Paul Cercueil wrote:
> This patch is backported from upstream.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../0002-ppc-disassembler-build-fix.patch          | 53 ++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 package/lightning/0002-ppc-disassembler-build-fix.patch

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

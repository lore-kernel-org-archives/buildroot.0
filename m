From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 10:51:17 +0200
Subject: [Buildroot] [PATCH] openssh: fix static compilation
In-Reply-To: <20150829074635.GA14683@waldemar-brodkorb.de>
References: <20150829074635.GA14683@waldemar-brodkorb.de>
Message-ID: <20150829105117.0397e777@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Sat, 29 Aug 2015 09:46:35 +0200, Waldemar Brodkorb wrote:
> PIE and static doesn't work on Linux.
> 
> Fixes:
> http://autobuild.buildroot.net/results/dce/dce0202e039f4636d68532c4aab8738938b76650/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/openssh/openssh.mk |    4 ++++
>  1 file changed, 4 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

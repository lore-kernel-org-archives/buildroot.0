From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 22:20:41 +0200
Subject: [Buildroot] [PATCH] binutils: fix bfin compile error
In-Reply-To: <20170426174802.GA30776@waldemar-brodkorb.de>
References: <20170426174802.GA30776@waldemar-brodkorb.de>
Message-ID: <20170504222041.6c886f0c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 26 Apr 2017 19:48:02 +0200, Waldemar Brodkorb wrote:
> Newer gcc requires even lower optimization, only with -O0 we
> can successfully compile binutils for the target.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/fb95cd7f7fcc532d036ed8f13853bc6f9a64d1b3
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/binutils/binutils.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

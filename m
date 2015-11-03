From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 20:51:54 +0100
Subject: [Buildroot] [PATCH] libpcap: fix sparc64 build, -fPIC required
In-Reply-To: <20151103171735.GA32079@waldemar-brodkorb.de>
References: <20151103171735.GA32079@waldemar-brodkorb.de>
Message-ID: <20151103205154.19856f90@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Tue, 3 Nov 2015 18:17:35 +0100, Waldemar Brodkorb wrote:
> Should fix following autobuilder issues:
> http://autobuild.buildroot.net/results/e79353496aa91848c76f15c561efdd84476c20ac/
> http://autobuild.buildroot.net/results/a859ecb153838837e9a73b47ed7e1105d6be55ac/
> http://autobuild.buildroot.net/results/f2ce1899a1144bec23fb25f4ce36dc78d768f8a8/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/libpcap/libpcap.mk |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied after s/needs/need/ as noticed by Baruch, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

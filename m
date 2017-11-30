From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Nov 2017 11:39:24 +0100
Subject: [Buildroot] [PATCH next 1/3] uclibc: enable NPTL for or1k
In-Reply-To: <20171130055853.GA24600@waldemar-brodkorb.de>
References: <20171130055853.GA24600@waldemar-brodkorb.de>
Message-ID: <20171130113924.5897de8e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Nov 2017 06:58:54 +0100, Waldemar Brodkorb wrote:
> With 1.0.27 NPTL for or1k is improved and can be used
> by default.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/uclibc/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

All three patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

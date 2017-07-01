From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 10:02:09 +0200
Subject: [Buildroot] [PATCH] squid: uClibc workaround no longer required
In-Reply-To: <20170627190629.GA1589@waldemar-brodkorb.de>
References: <20170627190629.GA1589@waldemar-brodkorb.de>
Message-ID: <20170701100209.7992e0f2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Jun 2017 21:06:30 +0200, Waldemar Brodkorb wrote:
> As all librt and libpthread functions are integrated into
> libc for a while, workaround no longer required.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/squid/squid.mk | 5 -----
>  1 file changed, 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

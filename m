From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jun 2016 09:46:50 +0200
Subject: [Buildroot] [PATCH] libsigsegv: enable for sparc
In-Reply-To: <20160603031553.GA28275@waldemar-brodkorb.de>
References: <20160603031553.GA28275@waldemar-brodkorb.de>
Message-ID: <20160603094650.69a12e88@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 3 Jun 2016 05:15:53 +0200, Waldemar Brodkorb wrote:
> Now that uClibc-ng 1.0.15 is in use, we can reenable
> this package as context functions are available.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/libsigsegv/Config.in |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

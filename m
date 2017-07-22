From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 23:41:59 +0200
Subject: [Buildroot] [PATCH] ndisc6: patch no longer required
In-Reply-To: <20170627190833.GA5404@waldemar-brodkorb.de>
References: <20170627190833.GA5404@waldemar-brodkorb.de>
Message-ID: <20170722234159.70362455@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Jun 2017 21:08:33 +0200, Waldemar Brodkorb wrote:
> In uClibc-ng 1.0.25 the issue was fixed and FAVOR_BSD is gone.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/ndisc6/0001-trace-tcp-upd-uClibc-fix.patch | 64 ----------------------
>  1 file changed, 64 deletions(-)
>  delete mode 100644 package/ndisc6/0001-trace-tcp-upd-uClibc-fix.patch

Applied to master, after reworking the commit log (the fix isn't in
uClibc-ng 1.0.25).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

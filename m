From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Oct 2014 11:22:18 +0200
Subject: [Buildroot] [PATCH RESEND] package/Makefile.in: Fix dependency
 for selecting uclinux as TARGET_OS
In-Reply-To: <1379927810.16071.2.camel@phoenix>
References: <1379927810.16071.2.camel@phoenix>
Message-ID: <20141012112218.433e0a61@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Axel Lin,

On Mon, 23 Sep 2013 17:16:50 +0800, Axel Lin wrote:
> Current setting only allows blackfin to select uclinux as TARGET_OS.
> However, some noMMU ARM platforms that using FLAT binary format also need to
> select uclinux as TARGET_OS. Fix the dependency.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Peter, please apply :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

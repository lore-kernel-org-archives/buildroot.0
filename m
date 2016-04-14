From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 14 Apr 2016 04:50:18 +0200
Subject: [Buildroot] [PATCH] arch/x86: remove support for i386
In-Reply-To: <1459453188-23705-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1459453188-23705-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160414025018.GK7454@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Thomas Petazzoni wrote,

> The Linux kernel doesn't even support i386 anymore, there is no NPTL
> support for i386 and uClibc-ng only supports NPTL on x86, so there is
> essentially no usable thread implementation. Most likely glibc and
> musl also don't support i386 either. So it's time to remove the
> support for this architecture variant.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Looks good to me,
Reviewed-by: Waldemar Brodkorb <wbx@openadk.org>

best regards
 Waldemar

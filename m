From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 31 Jul 2016 23:01:02 +0200
Subject: [Buildroot] [PATCH] util-linux: use upstream patch to fix
 uClibc build issue
In-Reply-To: <20160731225848.070d03f6@free-electrons.com>
References: <20160731160852.GA5227@waldemar-brodkorb.de>
 <20160731225848.070d03f6@free-electrons.com>
Message-ID: <20160731210102.GW22524@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Thomas Petazzoni wrote,

> Hello,
> 
> On Sun, 31 Jul 2016 18:08:52 +0200, Waldemar Brodkorb wrote:
> > Upstream has this patch a while and other projects are using
> > it already. So better switch to this.
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
> 
> Which build issue is this fixing?

No build issue. It is just the better fix for the problem.
As scanf does work in uClibc-ng. No need for the patch.
It is a cleanup patch, I wanted to do some weeks ago.

best regards
 Waldemar

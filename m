From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 27 Oct 2015 20:52:39 +0100
Subject: [Buildroot] [PATCH] uclibc: get rid of ARC's uClibc fork
In-Reply-To: <1445959005-23917-1-git-send-email-abrodkin@synopsys.com>
References: <1445959005-23917-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20151027195239.GT21428@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Alexey Brodkin wrote,

> For quite some time all ARC changes have been pushed upstream.
> So both uClibc master branch and uClibc-ng have full ARC support
> including the most recent changes.
> 
> I.e. finally we have reached the point when there's no need in
> Synopsys fork of uClibc on GitHub and it will soon be obsoleted and
> removed at some pint of time.
> 
> Now since vanilla uClibc hasn't seen any releases for many years we cannot
> really use it for ARC. Fortunately there exists uClibc-ng and Waldemar
> cuts releases regularly - that works perfectly fine for us.
> 
> That patch removes all mentions of ARC's uClibc which in turn makes
> uClibc-ng default libc for ARC.

I vote for it :=)
Acked-By: Waldemar Brodkorb <wbx@uclibc-ng.org>

best regards
 Waldemar

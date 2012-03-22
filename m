From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Thu, 22 Mar 2012 16:49:31 +0000 (UTC)
Subject: [Buildroot] Can I use the toolchain build with buildroot,
 as an external toolchain ?
References: <1531E53627F1F749B4FE809BF2A4EB6703136FE8@WETMEX10.loepfe.com>
Message-ID: <jkfl6r$bev$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-03-22, Vellemans, Noel <Noel.Vellemans@visionBMS.com> wrote:

> Q: Can I use a toolchain that has been build with buildroot (before)
> as an external toolchain ?

Yes.  I used to do that.  After a few weeks, I gave up on it and built
an external toolchain using crosstool-ng.

> Q: Is this explained somewhere, on how to do this?

No, because it's much simpler to just build an external toolchain
using crosstool-ng, and then configure Buildroot use that.

-- 
Grant Edwards               grant.b.edwards        Yow! I am NOT a nut....
                                  at               
                              gmail.com            

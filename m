From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Feb 2015 07:10:05 +0100
Subject: [Buildroot] [PATCH] add basic support for uClibc-ng
In-Reply-To: <20150210172555.GE22344@waldemar-brodkorb.de>
References: <20150209181636.GA17451@waldemar-brodkorb.de>
 <20150209205338.604f740e@free-electrons.com>
 <20150210172555.GE22344@waldemar-brodkorb.de>
Message-ID: <20150211071005.4cbd071a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Tue, 10 Feb 2015 18:25:55 +0100, Waldemar Brodkorb wrote:

> > I don't think introducing this symbol is needed. Instead, we can just
> > make uClibc-ng another version of uClibc. Like the following (untested) :
> 
> I thought about this in my first try, but I have following problem:
> When you choose uClibc-ng 1.0.0 instead of uClibc, the default
> config string is _not_ automatically changed.

I'm not sure to understand: which "config string" are you talking about?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 11 Feb 2015 10:26:49 +0100
Subject: [Buildroot] [PATCH] add basic support for uClibc-ng
In-Reply-To: <20150211071005.4cbd071a@free-electrons.com>
References: <20150209181636.GA17451@waldemar-brodkorb.de>
 <20150209205338.604f740e@free-electrons.com>
 <20150210172555.GE22344@waldemar-brodkorb.de>
 <20150211071005.4cbd071a@free-electrons.com>
Message-ID: <20150211092649.GL22344@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Thomas Petazzoni wrote,

> Dear Waldemar Brodkorb,
> 
> On Tue, 10 Feb 2015 18:25:55 +0100, Waldemar Brodkorb wrote:
> 
> > > I don't think introducing this symbol is needed. Instead, we can just
> > > make uClibc-ng another version of uClibc. Like the following (untested) :
> > 
> > I thought about this in my first try, but I have following problem:
> > When you choose uClibc-ng 1.0.0 instead of uClibc, the default
> > config string is _not_ automatically changed.
> 
> I'm not sure to understand: which "config string" are you talking about?

Sorry, I meant the default string pointing to the uClibc
configuration file. It is not switched, when choosing uClibc-ng.

Clearer now?

best regards
 Waldemar

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Feb 2015 14:17:29 +0100
Subject: [Buildroot] [PATCH] add basic support for uClibc-ng
In-Reply-To: <20150211092649.GL22344@waldemar-brodkorb.de>
References: <20150209181636.GA17451@waldemar-brodkorb.de>
 <20150209205338.604f740e@free-electrons.com>
 <20150210172555.GE22344@waldemar-brodkorb.de>
 <20150211071005.4cbd071a@free-electrons.com>
 <20150211092649.GL22344@waldemar-brodkorb.de>
Message-ID: <20150211141729.72df7fd0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Wed, 11 Feb 2015 10:26:49 +0100, Waldemar Brodkorb wrote:

> Sorry, I meant the default string pointing to the uClibc
> configuration file. It is not switched, when choosing uClibc-ng.

It is like this for all non-promptless string options: even if you
switch between uClibc 0.9.31 and 0.9.33, the string option value will
not be changed, unless it's the first time you run "make menuconfig".

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

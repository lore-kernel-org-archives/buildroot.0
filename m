From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Thu, 8 Oct 2009 21:10:38 +0200
Subject: [Buildroot] Compiler for arm7tdmi
In-Reply-To: <9e4733910910081155p1e1101abofef056aa21ce82db@mail.gmail.com>
References: <9e4733910910081155p1e1101abofef056aa21ce82db@mail.gmail.com>
Message-ID: <20091008191038.GC2266@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 08, 2009 at 02:55:48PM -0400, Jon Smirl wrote:
>I'm not having any luck building a compiler for arm7tdmi. I have the
>static_flat file format selected, I couldn't get Elf to build. My goal
>is to compile Contiki for a Freescale MC1322x.

I don't think that flat support is working in the official repo.
I once started to add support in my repo.or.cz/w/buildroot tree, but
even that is not finished yet.

patches welcome..
HTH,

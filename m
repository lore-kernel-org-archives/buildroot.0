From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 7 Nov 2016 19:25:31 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-11-05
In-Reply-To: <20161106150623.2b7fd549@free-electrons.com>
References: <20161106073024.E75F820798@mail.free-electrons.com>
 <20161106150623.2b7fd549@free-electrons.com>
Message-ID: <20161107182531.GB27313@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Thomas Petazzoni wrote,

> >         bfin |                     php-7.0.12 | NOK | http://autobuild.buildroot.net/results/8326f24511d3b109d22a76660adc017bbcaca197
> 
> Waldemar, this is a compiler segfault, on mainline gcc for Blackfin.
> Anything we can do?

Last time I checked I suggested to disable it for bfin.
But now I found a simple patch which avoids the segfault. I try to
find a simple test case to report the issue upstream.
Do you want me to sent a patch fixing the build issue without a bug
report?
 
> >         m68k |               xmlstarlet-1.6.1 | NOK | http://autobuild.buildroot.net/results/02f9fc5884d3a7d460b96937183362d6c3fc6fde
> 
> Link issue. Waldemar?

Patch sent.

best regards
 Waldemar

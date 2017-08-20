From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Aug 2017 14:14:56 +0200
Subject: [Buildroot] [PATCH] lttng-tools: disable build-time test
 failing for musl/uclibc
In-Reply-To: <20170820103008.GA28645@waldemar-brodkorb.de>
References: <20170820103008.GA28645@waldemar-brodkorb.de>
Message-ID: <20170820141456.7d79c879@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 Aug 2017 12:30:08 +0200, Waldemar Brodkorb wrote:
> Disable a failing build time test, which uses dlmopen
> without the need for autoreconf.

Why without doing an autoreconf ?

Also perhaps it is in fact better to add a --disable-tests option,
since we don't really need to build tests in the context of Buildroot.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

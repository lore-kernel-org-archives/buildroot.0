From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 11:49:05 +0200
Subject: [Buildroot] [PATCHv4] bfin: fix issues with internal toolchain,
 re-enable C++ support
In-Reply-To: <20160819222738.GA22524@waldemar-brodkorb.de>
References: <1471638312-4799-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160819222738.GA22524@waldemar-brodkorb.de>
Message-ID: <20160820114905.6a5150d6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 Aug 2016 00:27:38 +0200, Waldemar Brodkorb wrote:

> > Since this commit fixes C++ support in Blackfin, it re-enables the
> > selection of C++ support for this architecture.  
> 
> Tested and works great. Awesome. Wonderful.
> Thanks for cleaning up my messy hacks :)

Thanks for your testing! I've added a formal Tested-by tag from you in
the commit log.

We still have the --disable-symvers workaround to investigate, though.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 22:02:46 +0200
Subject: [Buildroot] [PATCH] libmicrohttpd: update to 0.9.51
In-Reply-To: <20161007165452.GL2052@waldemar-brodkorb.de>
References: <20161001100102.GA26989@waldemar-brodkorb.de>
 <20161007160432.635dc932@free-electrons.com>
 <20161007165452.GL2052@waldemar-brodkorb.de>
Message-ID: <20161007220246.3af42e98@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 7 Oct 2016 18:54:52 +0200, Waldemar Brodkorb wrote:

> Are there any plans to remove this very old toolchain?
> One of my motivation of getting internal bfin toolchain in a good
> shape was the possibility to remove the old toolchain to get rid
> of many package failures regarding the very old uClibc.

Right. What's the state of things with the new toolchain? Are C++
applications now working fine on the target? Are there any other known
issues?

I guess we probably want to keep the Blackfin ADI toolchains around for
a cycle or two, and then get rid of them.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

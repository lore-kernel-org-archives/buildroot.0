From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Feb 2017 17:02:49 +0100
Subject: [Buildroot] Analysis of build results for 2017-02-26
In-Reply-To: <1488296096.2557.13.camel@synopsys.com>
References: <20170227072848.7BD45207F5@mail.free-electrons.com>
 <20170227142854.34d3fb86@free-electrons.com>
 <1488296096.2557.13.camel@synopsys.com>
Message-ID: <20170228170249.6c4911a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Feb 2017 15:34:56 +0000, Vlad Zakharov wrote:

> > Vlad, could you have a look into this? We have
> > package/gcc/6.3.0/895-bfin-define-REENTRANT.patch for Blackfin in the
> > tree, but we don't have the corresponding patch for ARC.  
> 
> The patch you have provided in gcc bugzilla solves the issue, thanks.
> I am going to send it to Buildroot soon.

Great, thanks for checking!

> If you want to upstream your patch to gcc please send it to GCC mailing list. And please don't forget to include Claudiu
> Zissulescu <claziss@synopsys.com>?in CC as he is co-maintainer of GCC port for ARC.

I received some feedback from Claudio through the gcc bug tracker. I'll
try to get my gcc patch submitted upstream. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

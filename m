From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 26 Mar 2017 14:29:52 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-03-24
In-Reply-To: <fbee7b83-68ff-9081-28ef-4f75b1c7cc48@mind.be>
References: <20170325072834.09F51207FA@mail.free-electrons.com>
 <fbee7b83-68ff-9081-28ef-4f75b1c7cc48@mind.be>
Message-ID: <20170326122951.GK22954@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Arnout Vandecappelle wrote,

> 
> 
> On 25-03-17 08:28, Thomas Petazzoni wrote:
> >         or1k |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/fa37b4cee01301dc01394fb279e7a16f10e3a6b5 | ORPH
> 
>  This looks to me like a compiler bug. It seems that with -fPIC, static class
> members are generated with a 16-bit GOT entry. That means that they can only be
> used in binaries smaller than 64K...
> 
>  Looks like Waldemar asked about this at some point on #openrisc but got no
> response.
> 
>  What to do with this?

Can we disable this package for or1k?
May be things getting better when gcc7 is out and might include or1k
support.

https://lists.librecores.org/pipermail/openrisc/2017-February/000501.html

best regards
 Waldemar

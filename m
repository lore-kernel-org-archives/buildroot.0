From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 27 May 2016 23:01:23 +0200
Subject: [Buildroot] Analysis of build results for 2016-05-26
In-Reply-To: <20160527224133.22b8cb60@free-electrons.com>
References: <20160527063021.48E29101C97@stock.ovh.net>
 <20160527224133.22b8cb60@free-electrons.com>
Message-ID: <20160527210123.GH22609@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> Waldemar, Samuel, Gwenhael, Bernd, Gustavo, Vicente, some questions for you below.
> 
> On Fri, 27 May 2016 08:30:21 +0200 (CEST), Thomas Petazzoni wrote:
> >        sparc |                 moarvm-2016.04 | NOK | http://autobuild.buildroot.net/results/0c3e8931b2d157764ed18c2a97f26c8e77ea426e/
> 
> Waldemar?

Should be the same problem as for sparc64, some required atomic
functions are not implemented in libatomic_ops used by moarvm. So even if we
fix the issue that v9 assembly is used, it will not work.

http://buildroot.uclibc.narkive.com/Gnhvpx9Y/patch-v3-moarvm-disable-for-sparc64

best regards
 Waldemar

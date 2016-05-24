From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 May 2016 16:58:44 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-05-23
In-Reply-To: <574459AC.5010001@zacarias.com.ar>
References: <20160524063023.4C8B610173F@stock.ovh.net>
 <574458DE.4040302@imgtec.com> <574459AC.5010001@zacarias.com.ar>
Message-ID: <20160524165844.6cd99638@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 24 May 2016 10:39:56 -0300, Gustavo Zacarias wrote:

> Yes, don't use 4.5.0 - 4.5.4 headers, it's already fixed by dropping the 
> connman workaround patch which isn't compatible with the proper fix, 
> Thomas rebuilding the test toolchains and bumping the headers to 4.5.5.
> As for covering the broken headers scenario any patch that's created for 
> that is unlikely to be accepted upstream, and any toolchain that ships 
> with those broken headers could be called "broken".

I have rebuilt the toolchains and deployed them yesterday, I've sent an
e-mail about this on the list. So normally, those issues should no
longer show up. If they do, then we have another problem (or I messed
up the toolchain update).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

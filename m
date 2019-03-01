From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 01 Mar 2019 11:14:42 +0100
Subject: [Buildroot] [PATCH] package/pkg-generic: speed up
 RECURSIVE_FINAL_DEPENDENCIES
In-Reply-To: <20190226211547.GC15265@scaer> (Yann E. MORIN's message of "Tue, 
 26 Feb 2019 22:15:47 +0100")
References: <20190225235504.486-1-tpiepho@impinj.com>
 <20190226211547.GC15265@scaer>
Message-ID: <87tvgmucj1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > Here, the timings were slightly reversed, with the strip + sort being a
 > bit faster than just sort. I think it might be due to you and I using
 > different config files, where the dependency depths and widths [0] are
 > different, and thus favour one or the other in intricate manners.

 > So I did a few randconfigs, and it turns out that indeed the order
 > fluctuates slightly, with sort+strip sometimes wining, sometimes losing.

 > And either way, the delta is in the sub-second range, now. So I think
 > one is as good as the other, so:

 > Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 > Thank you! :-)

Yes, thanks for the change and detailed commit message.

Committed, thanks.

-- 
Bye, Peter Korsgaard

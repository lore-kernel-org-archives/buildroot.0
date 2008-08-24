From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Aug 2008 09:53:57 +0200
Subject: [Buildroot] GDB attempting to apply patches severla times
In-Reply-To: <2590773a0808141241u4210fa5bh114585858cff6080@mail.gmail.com>
	(Christopher Taylor's message of "Thu\,
	14 Aug 2008 15\:41\:42 -0400")
References: <2590773a0808141241u4210fa5bh114585858cff6080@mail.gmail.com>
Message-ID: <87prnyrgq2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christopher" == Christopher Taylor <chtaylo3@gmail.com> writes:

Hi,

 Christopher> Has anyone noticed that buildroot attempts to apply the
 Christopher> GDB patches twice?  Seems like this only happens when I
 Christopher> have buildroot build GDB for the target (as a server and
 Christopher> regularly) and for the host.  When I take the host out,
 Christopher> it seems to work ok....

Sorry about that - Got broken in r22624 and is now fixed in r23193.

Thanks!

-- 
Bye, Peter Korsgaard

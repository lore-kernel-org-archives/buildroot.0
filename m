From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 12 Jul 2014 17:12:33 -0300
Subject: [Buildroot] Open bug overview: help wanted!
In-Reply-To: <CAAXf6LU8ZkC4uk5qkq8HGN-zfL=MwAKJP4E=1sDNRDMSJwUutw@mail.gmail.com>
References: <CAAXf6LU8ZkC4uk5qkq8HGN-zfL=MwAKJP4E=1sDNRDMSJwUutw@mail.gmail.com>
Message-ID: <53C196B1.6080104@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/12/2014 03:50 PM, Thomas De Schampheleire wrote:

> https://bugs.busybox.net/show_bug.cgi?id=6950 normal
> gustavo at zacarias.com.ar Full unicode support in ncurses
> Gustavo is working on this.

Feedback given on the patch, no response so far.
It just needs a slight fix for static builds like i mentioned, worst
case scenario i can add a patch for that besides the two i've sent
fixing nano and statserial.

> https://bugs.busybox.net/show_bug.cgi?id=4790 normal jacmet at uclibc.org
> Running udhcpc on a system with NFS root kills NFS
> We discussed this patch in the context of the last release cycle. I
> believe the end conclusion is that we shouldn't try to be too smart
> with respect to the init scripts/configuration files and instead
> document the gotchas in the manual. Any takers?

> 6230 minor unassigned at buildroot.uclibc.org Cannot compile gcc without
> threads (uClibc-based)

This one is basically closed via
befab216a29927f598e0a3ba0b012f7e822bb235 (WONTFIX) for ARM7.

> 7118 enhancement abrodkin at synopsys.com Package "thrift" requires
> atomic operations

Already solved.
Regards.

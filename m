From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 May 2014 15:35:47 +0200
Subject: [Buildroot] [PATCH] iptraf-ng: new package
In-Reply-To: <20140509131931.GC764@arch.cereza> (Ezequiel Garcia's message of
 "Fri, 9 May 2014 10:19:31 -0300")
References: <1399493248-15443-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <8738gjb20g.fsf@dell.be.48ers.dk> <20140509131931.GC764@arch.cereza>
Message-ID: <87ppjn9irw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ezequiel" == Ezequiel Garcia <ezequiel.garcia@free-electrons.com> writes:

Hi,

 >> I don't see any pthread references anywwhere, but it does include
 >> netinet/ip6.h so it needs to depend on BR2_INET_IPV6.
 >> 

 > Arg! Searched for 'fork' instead of 'threads' and it seems I missed the ip6...

Ohh, so it needs to depend on BR2_USE_MMU. I'll fix that.

 >> Committed with these fixes, thanks.

 > OK, good. Just tested it builds fine.

 > Thanks,

Great, and you're welcome.

-- 
Bye, Peter Korsgaard

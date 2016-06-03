From: Brian Foster <brian.foster@maximintegrated.com>
Date: Fri, 3 Jun 2016 12:13:12 +0200
Subject: [Buildroot] [BUG 2016.05] uClibc-ng argp-standalone War
In-Reply-To: <20160602171248.GN6825@waldemar-brodkorb.de>
References: <1902632.QltqilAAjO@laclwks004>
 <20160602171248.GN6825@waldemar-brodkorb.de>
Message-ID: <4575130.y3oBZYB1YT@laclwks004>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 02-June-2016 19:12:49 Waldemar Brodkorb wrote:
> Brian Foster wrote,
> > In 2016.05 there is a war between uClibc-ng and argp-standalone [...]
> 
> Maybe it would be good to just use uClibc-ng argp and block
> argp-standalone in case uClibc-ng is used.

Hi Waldemar!

 Broadly speaking, I concur, but I have done nothing (to-date)
 to try and confirm, or to research the history of the issue.

 Actually, I am more inclined to the either-or approach, that is,
 if a package needs "argp" functionality, then either arp-standalone
 or (if using uClibc-ng) uClibc's arp functionality must be present.
 However, I'm uncertain how to do that...?  ;-\   (Any pointers?)

> I have reports from other projects, which successfully replaced
> argp-standalone with the uClibc-ng included argp implementation.

 That is good to know, thanks!

> @Brian: Could you cook up a patch and do some testing?

 Maybe.  *Speculating*, I suspect all I will be able to do is cook
 up trial Patch(es?) with rng-tools as the Test case.

cheers!
	-blf-

> best regards
>  Waldemar

-- 
Brian Foster
Principal MTS, Software        |  La Ciotat, France
Maxim Integrated               |  http://www.maximintegrated.com/

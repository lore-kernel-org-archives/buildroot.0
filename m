From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 28 Oct 2013 09:53:51 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-10-24
In-Reply-To: <20131028134614.1d9a41e2@skate>
References: <20131025063005.51B7752C609@lolut.humanoidz.org>	<526A26EB.7010804@mind.be>	<20131025124746.0dbffd63@skate>	<526A4D39.3040106@zacarias.com.ar>	<20131026084741.5cab8678@skate>	<526B9237.8030602@zacarias.com.ar>	<526E468C.7080008@zacarias.com.ar>
 <20131028134614.1d9a41e2@skate>
Message-ID: <526E5E5F.1080601@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/28/2013 09:46 AM, Thomas Petazzoni wrote:

> Originally, the autobuilders had a cache on a per build thread basis
> (my build server runs 3 builds in parallel). So it meant that a given
> tarball what at the maximum downloaded three times.
> 
> However, since some time, I have changed this to remove 5 random
> tarballs after each build, so that the cache gets progressively
> refreshed, and the autobuilders also check upstream URLs. I've done
> that after we had realized that several of our upstream URLs in
> Buildroot were broken, which directly affects new users (but wasn't
> visible in the autobuilders).
> 
> I can certainly adjust the policy by reducing the number of removed
> tarballs to 1 or 2 after each build, for example. But I still believe
> that doing this allows us to verify the upstream URLs thanks to the
> autobuilders.

Once upon i time i ran a kernel.org mirror, and i had several
very-aggresive fetchers around. They were mostly a couple of ISPs
fetching a fixed kernel source every 5-10 minutes or so.
I didn't feel very happy about it, after all it's a service to the
community rather than commercial entities (with the mirror
server/bandwidth being paid out of my pocket without any monetary
benefit whasoever).
I tried reaching to the people responsible for those IP blocks but
didn't get anywhere, so eventually i blocked the bot IPs into oblivion.
Eventually one or two of them switched IPs and i did the same until it
all calmed down.
Granted this was far more aggresive than the autobuilders so i'm
smelling something odd here as i've mentioned Peter on irc.
I'm getting rejected from a hetzner server on both IPv4 & v6, Peter too
from hetzner, and it would be doubtful that a whole subnet is blocked
(also i didn't do anything aggresive from the server IP, maybe the
previous user/owner did but it would be VERY odd).
I tried reaching out in #mpd on irc without answer yet, i'll try mailing
someone if that doesn't work, at least to confirm/deny it's some filter.
Regards.

From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 26 Oct 2013 06:58:15 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-10-24
In-Reply-To: <20131026084741.5cab8678@skate>
References: <20131025063005.51B7752C609@lolut.humanoidz.org>	<526A26EB.7010804@mind.be>	<20131025124746.0dbffd63@skate>	<526A4D39.3040106@zacarias.com.ar>
 <20131026084741.5cab8678@skate>
Message-ID: <526B9237.8030602@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/26/2013 03:47 AM, Thomas Petazzoni wrote:
> Interestingly, Yann E. Morin also reported the same problem (Connection
> refused) when connecting from one of his machine, which has (as far as
> I know) is not used as a build server that could cause repeated
> downloads of the mpd tarball. So it seems like it's not such my build
> server that has been blacklisted. Maybe something we should report to
> the musicpd people.

Interesting indeed.
Testing from an IPv6-capable host i'm seeing the same problem, but it's
not IPv6-related, the DNS resolves just fine, tries IPv6 and fails, then
tries IPv4 and fails too.
If wget is forced to IPv4 is still fails.
The interesting part is that said machine is in germany, looks like
europe is having issues with musicpd.org ?!?
The funniest part is this:

www.musicpd.org -> 78.46.162.86 -> hetzner-hosted
my machine -> 78.46.79.162 -> hetzner-hosted

WTF? (and it's working just fine from .ar at exactly the same time).
I'll try contacting hetzner about it since i can ping it, but not http
to it.
Regards.

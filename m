From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 06 Jan 2015 08:35:28 -0300
Subject: [Buildroot] [PATCH] automake: bump version to 1.15
In-Reply-To: <54ABC4F5.9060605@imgtec.com>
References: <1420535267-45405-1-git-send-email-Vincent.Riera@imgtec.com>
 <54ABC247.9030500@zacarias.com.ar> <54ABC4F5.9060605@imgtec.com>
Message-ID: <54ABC880.3090400@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/06/2015 08:20 AM, Vicente Olivert Riera wrote:

> No, I have only tried to compile those packages depending on
> "host-automake": freetype, sdl, gpm and znc, if I recall correctly. Is
> not enough? I can do an allyespackageconfig if you require it.

AUTORECONF pulls host-automake in as well, so it's not just the
face-value ones.
I do not require anything (for this, i still eat hehe) :)
It's just a "how much breakage" we can expect from this question if you
did the test so it would be convenient since some fixes will possibly be
required.
Normally some of those "warning blah this blah other" you see when
autoreconfing a package can become an error with major bumps since they
sit in deprecated mode (warning) for a couple of releases until it goes
into removal.
The usual problem is with old packages that haven't seen a release in
some time and hence didn't update their auto* stuff accordingly, or devs
who haven't kept up with new auto* stuff/releases.
Regards.

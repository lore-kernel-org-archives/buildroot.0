From: Simon Dawson <spdawson@gmail.com>
Date: Tue, 25 Feb 2014 15:17:35 +0000
Subject: [Buildroot] Analysis of VLC build failures
In-Reply-To: <530C4314.4000203@mind.be>
References: <20140223073009.3676E101056@stock.ovh.net>
 <20140223110021.16b6b976@skate> <530C4314.4000203@mind.be>
Message-ID: <CAHt8ZCO3fhuv__zQweidJb=2TSBdC0M27P487=AOx1+780cm2g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25 February 2014 07:15, Arnout Vandecappelle <arnout@mind.be> wrote:
>  My feeling is that vlc is currently not in a state that we can release
> it. I have no issue with including some package that doesn't work very
> well in a release, but for a flagship package like vlc I think it's
> important that we really get it right. And currently we don't.

When I (re-)added this package, I had hoped to have more time to spend
on getting it working properly. (As it happens, the project for which
I needed vlc has now been abandoned.)

I tend to agree that this is a potentially "high profile" package, and
that it ought perhaps to be dropped from the 2014.02 release.

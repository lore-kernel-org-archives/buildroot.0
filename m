From: Joachim Nilsson <troglobit@gmail.com>
Date: Sat, 23 May 2020 14:11:19 +0200
Subject: [Buildroot] Merge window
In-Reply-To: <87eercl3mh.fsf@dell.be.48ers.dk>
Message-ID: <C2Y3KLSQRHAB.3EFDD55PALM87@luthien>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri May 22, 2020 at 1:29 PM CEST, Peter Korsgaard wrote:
> [snip]
> It would be good to add something like this to the manual. Would you be
> interested in working on that?

Sure, how about something like this, or were you thinking about something
more?  I can whip up a real patch for further comments.

--8<-----------------------------------------------------------------
== Release Engineering

The Buildroot project makes quarterly releases with monthly bugfix
releases.  The first release of each year is a long term support
release, LTS.

 - Quarterly releases: 2020.02, 2020.05, 2020.08, and 2020.11
 - Bugfix releases: 2020.02.1, 2020.02.2, ...
 - LTS releases: 2020.02, 2021.02, ...

Releases are supported until the first bugfix release of the next
release, e.g., 2020.05.x is EOL when 2020.08.1 is released.

LTS releases are supported until the first bugfix release of the next
LTS, e.g., 2020.02.x is supported until 2021.02.1 is released.

=== Development

Each release cycle consist of two months of development on the +master+
branch and one month stabilization before the release is made.  During
this phase no new features are added to +master+, only bugfixes.

The stabilization phase starts with tagging +-rc1+, every week until the
release, another release candidate is tagged.

To handle new features and version bumps during the stabilization phase,
a +next+ branch may be created for these features.  Once the current
release has been made, the +next+ branch is merged into +master+ and
the development cycle for the next release continues there.
--8<-----------------------------------------------------------------

> The reason why your patch has not gotten any feedback is simply that we
> get a lot of patches. The backlog is currently at 470 patches.

Woah ... OK, thanks! :)

Best regards
 /Joachim

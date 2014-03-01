From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 1 Mar 2014 17:16:27 +0100
Subject: [Buildroot] Evaluation of the 2014.02 stabilization cycle
Message-ID: <CAAXf6LW5FsWksuQH4Gpof-Ze=r9PzeZ1-zZYNZnyZidhDV+gfQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2014.02 has been released, and I'd like to take this
opportunity to reflect on the stabilization cycle of this release
(during the month of February). Feel free to share your thoughts
too...

What I liked was:
- many developers analyzing and fixing autobuild failures. I have seen
autobuild fixes passing by during the entire month, until the very
end, and this has made a great improvement in our 'out-of-the-box
experience'. Looking at the statistics [1], at the beginning of the
month we were around 50% success rate, while we were able to reach 87%
at the day of the release!
Moreover, a number of the remaining problems are already analyzed and
will be fixed in the next release, although we can expect new failures
coming in now that the -next branch has been merged into master.

- several improvements to the documentation have been sent. While our
documentation is already pretty good, things can always improve, so
these patches were very welcome!

- the fact that patches intended for 2014.02 (be it autobuild fixes,
documentation improvements, or other fixes) were applied swiftly by
Peter. Specifically for the autobuild results this was very useful, as
it allowed each day to show new failures (previously eclipsed by
existing failures).

- the fact that we closed a large amount of bugs. During the entire
month of February, we closed 36 bugs [2], and today there are only 16
bugs remaining [3]! Of these bugs, 7 are new packages.


What I did not like so much:

- the fact that many feature patches (that never had a chance to enter
2014.02) were sent during the stabilization cycle, even by regular
contributors. While I realize that we cannot expect non-regular
contributors to respect the standard release cycle, this is not true
for regular contributors.
There are two reasons why I find this inconvenient:

1. The large amount of feature patches clutters the mailing list, in
the sense that it is more difficult to see which mails/patches are
relevant for the upcoming release and which are for the next.

2. During the stabilization month, all the (limited) time that I can
spent on buildroot is spent on the upcoming release. This means that I
fully ignore any patch that is not intended for that release, which
means I won't review it (even though I would review the patch had it
come at another moment in the release cycle). If other people act the
same way, this means that patches sent during the stabilization month
receive less reviews than others.

To conclude, I would prefer if the focus of (almost) all regular
contributors would be on the stabilization of the release, and the
ongoing support of users, rather than sending/reviewing patches for
the next release.


Obviously, all of the above is just my opinion, and I welcome your own
opinions and feedback.

Thanks,
Thomas

[1] http://autobuild.buildroot.org/stats.php
[2] https://bugs.busybox.net/buglist.cgi?chfieldto=2014-02-28&query_format=advanced&chfieldfrom=2014-02-01&bug_status=RESOLVED&bug_status=VERIFIED&bug_status=CLOSED&product=buildroot
[3] https://bugs.busybox.net/buglist.cgi?query_format=specific&order=relevance+desc&bug_status=__open__&product=buildroot&content=

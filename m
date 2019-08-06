From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Aug 2019 15:26:17 +0200
Subject: [Buildroot] Feedback from the Buildroot hackathon
Message-ID: <20190806152617.10f7aed7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

As was announced on the mailing list [0], a Buildroot hackathon took
place in Toulouse, France, from August 1 to August 4. Arnout
Vandecappelle, Peter Korsgaard, Yann E. Morin, Romain Naour, Victor
Huesca and myself participated to this hackathon. We spent the full
four days, for early morning to late at night, working on Buildroot,
and making progress on various topics.

During the 4 days of hackathon, 308 commits were made to the Buildroot
Git repository, and 44 were made on the buildroot-test Git repository.

Some of the highlights:

 - Peter merged the series from Yann that allows BR2_EXTERNAL trees to
   provide external toolchains, and other virtual packages that have a
   choice (openssl, libjpeg). This is a nice new feature.

 - Romain spent significant time working on clang related topics, and
   also wrote a piece of documentation to explain how to use Buildroot
   to generate a toolchain, and then re-use it as an external toolchain.

 - Yann worked the OpenRC patch series, resending a new iteration of
   the series after doing lots of fixes and improvements.

 - Arnout spent a good amount of time working on the
   gobject-introspection series from Adam.

 - Arnout and Romain worked extensively on the lapack/python-numpy
   issues.

 - Victor (intern at Bootlin, working on Buildroot) continued to work
   on the Buildroot tooling, to improve e-mail notifications to include
   details about packages that are out of date, and about runtime tests
   and defconfigs failures.

 - I rebuilt all the Buildroot pre-built toolchains with Buildroot
   2019.05.1, and they are now used by autobuild.buildroot.org.

 - I merged the patch series from Atharva Lele reworking the
   autobuild-run script, and moving the calculation of the failure
   reason to the client side rather than the server side. A few other
   autobuild-run improvements were merged as well.

 - I merged a number of improvements to the daily-mail script,
   from Victor.

 - Collectively, we reviewed and merged tons of patches, reducing the
   patchwork backlog significantly. We also discussed a number of the
   remaining patches that are still sitting in patchwork.

 - And I'm sure I'm forgetting a number of other things that people
   worked on. Arnout, Yann, Peter, Romain, Victor, if you see anything

Overall, it was a very nice and productive hackathon. I'd like to thank
all the participants, who traveled to Toulouse, and dedicated 4 full
days of their summer to improving Buildroot.

I would like to take this opportunity to remind everybody that our next
Buildroot Developers meeting (open to everybody who wants to join),
will take place on October 25-27 in Lyon, France, right before the
Embedded Linux Conference Europe. Please register at [1] if you're
interested.

If the cost of traveling to Lyon is the limiting factor for you to
attend, please contact us, as we do have some travel budget available.

[0] http://lists.busybox.net/pipermail/buildroot/2019-June/253530.html
[1] https://elinux.org/Buildroot:DeveloperDaysELCE2019

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

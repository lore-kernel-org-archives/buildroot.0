From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 18 Apr 2019 00:16:41 +0200
Subject: [Buildroot] Qt5 parallel build of qmake
Message-ID: <5affd9e5-511b-394c-e2a0-51617489f1c1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi all,

 I've put a few people in Cc that seem to be active users of Qt5.

 I noticed during a test build that during the configure step, qmake is built
but not in parallel. I think it should be possible to enable parallel build for
qmake by passing MAKE="$(MAKE)" in the environment during configuration. Would
someone be interested in checking that out?

 Ideally, you should also test with different make versions because they
sometimes throw other stuff in the MAKE variable which may screw things up.

 Regards,
 Arnout

From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun,  4 Mar 2012 00:45:05 +0100
Subject: [Buildroot] Test infrastructure
Message-ID: <1330818307-22115-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 This patch series adds test infrastructure to buildroot.  On the
buildroot developer day we had a brief discussion about testing.  The
main conclusion was that we'd set up a site to log test results (an
action point for Peter that is still open).  To make it easier for
people to contribute to those test results, these patches create some
test infrastructure.

 For the time being, it contains just the defconfigs.  The idea is to
add more test configurations.  For instance, Peter and ThomasP could
add the test configurations they already use.

 Regards,
 Arnout

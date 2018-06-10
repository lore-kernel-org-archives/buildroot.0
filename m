From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Jun 2018 16:57:40 +0200
Subject: [Buildroot] Rust test too long
Message-ID: <20180610165740.1221b491@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Eric,

The tests.package.test_rust.TestRust test case takes more than 3 hours
and Gitlab, and causes the overall test suite to always fail:

  https://gitlab.com/buildroot.org/buildroot/pipelines/23578303/failures

(This one also has a failure related to check-package caused by the
mender package, but I've fixed that)

Is this expected that this test takes as much as 3 hours ? Is there
something we can do to reduce this ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

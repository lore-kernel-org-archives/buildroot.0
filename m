From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jan 2013 20:09:47 +0100
Subject: [Buildroot] Post-image script feature and other related fixes
Message-ID: <1358363393-29977-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

For quite a while, I had this post-image patch sitting around in one
of my customer's project, and the last mail from Stephan reminded me
that it was probably time to clean it up, update it and send it
upstream. That's the first two patches.

Then, in patches 3 and 4, I remove the package/customize stuff,
deprecated since a long time.

And in patch 5, I slightly update/improve the documentation about the
various solutions to customize the root filesystem.

Best regards,

Thomas

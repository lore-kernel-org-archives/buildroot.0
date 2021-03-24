From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Mar 2021 14:11:46 +0100
Subject: [Buildroot] [PATCH] configs/beaglebone_qt5: add overlay to
 defconfig
In-Reply-To: <20210319145907.464593-1-buildroot@heine.tech> (Michael Nosthoff
 via buildroot's message of "Fri, 19 Mar 2021 15:59:07 +0100")
References: <20210319145907.464593-1-buildroot@heine.tech>
Message-ID: <8735wkn1bh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Nosthoff via buildroot <buildroot@busybox.net> writes:

 > commit 8efc5dce98f9795d97b7a3452f9be4a774032379 added an overlay but
 > forgot to add it to the related defconfig.

 > Fixes: missing overlay data in image

 > Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard

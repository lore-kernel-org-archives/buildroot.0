From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Mar 2021 21:58:52 +0100
Subject: [Buildroot] [PATCH] toolchain: drop old
 BR2_TOOLCHAIN_HAS_BINUTILS_BUG_* options
In-Reply-To: <20210314220138.485204-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 14 Mar 2021 23:01:37 +0100")
References: <20210314220138.485204-1-thomas.petazzoni@bootlin.com>
Message-ID: <87lfagp6k3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19615 and
 > BR2_TOOLCHAIN_HAS_BINUTILS_BUG_20006 options were last selected by the
 > BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64 toolchain, but this
 > toolchain has been removed as part of commit
 > d87e114a8ffacdc71f853e7c4ea76fd3c6958d22 in August 2020.

 > It's time to get rid of those two options that are never enabled.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard

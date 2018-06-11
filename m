From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jun 2018 23:17:35 +0200
Subject: [Buildroot] [PATCH 2/2] ltrace: fix visibility of Config.in
 comment
In-Reply-To: <20180519205502.23746-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 19 May 2018 22:55:02 +0200")
References: <20180519205502.23746-1-thomas.petazzoni@bootlin.com>
 <20180519205502.23746-2-thomas.petazzoni@bootlin.com>
Message-ID: <87d0wx81lc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The BR2_PACKAGE_LTRACE option has some architecture dependencies, but
 > those architecture dependencies are not taken into account for the
 > Config.in comment.

 > To fix this, this commit introduces a BR2_PACKAGE_LTRACE_ARCH_SUPPORTS
 > hidden boolean that gets used by both the BR2_PACKAGE_LTRACE option
 > and the Config.in comment.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard

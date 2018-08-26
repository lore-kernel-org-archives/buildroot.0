From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Aug 2018 23:13:21 +0200
Subject: [Buildroot] [PATCH] rauc: add patch to make it build with Linux
 < 3.0
In-Reply-To: <20180824123517.25634-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 24 Aug 2018 14:35:17 +0200")
References: <20180824123517.25634-1-thomas.petazzoni@bootlin.com>
Message-ID: <87d0u4bzm6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > This commit adds a patch to RAUC that makes the eMMC boot partition
 > support optional. This allows RAUC to build successfully on systems
 > using Linux < 3.0.

 > Fixes:

 >   http://autobuild.buildroot.net/results/7e1cbeb458cb6536a36eae0d24cefb36edb22f55/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard

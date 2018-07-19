From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 12:09:16 +0200
Subject: [Buildroot] [PATCH] network-manager: sync kernel headers
 comment with actual dependency
In-Reply-To: <20180630221915.448-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 1 Jul 2018 00:19:15 +0200")
References: <20180630221915.448-1-thomas.petazzoni@bootlin.com>
Message-ID: <87lga7edv7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > In commit 52282828f06dc8aa3f721727f68a5096b9ed8b49
 > ("package/network-manager: add patches to build with kernel headers
 > 3.2"), network-manager was changed to build with kernel headers as old
 > as 3.2, instead of 3.7 before. The dependency was changed accordingly,
 > but the Config.in comment was not.

 > This commit fixes this inconsistency.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard

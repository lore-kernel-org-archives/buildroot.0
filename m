From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 17 Jan 2019 22:35:26 +0100
Subject: [Buildroot] [PATCH v7 2/8] Makefile: move definition of
 TARGET_DIR inside .config condition
In-Reply-To: <20181228104335.22379-3-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 28 Dec 2018 11:43:29 +0100")
References: <20181228104335.22379-1-thomas.petazzoni@bootlin.com>
 <20181228104335.22379-3-thomas.petazzoni@bootlin.com>
Message-ID: <87lg3j6k81.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > In a follow-up commit introducing per-package directory support, we
 > will need to define TARGET_DIR in a different way depending on the
 > value of a Config.in option. To make this possible, the definition of
 > TARGET_DIR should be moved inside the BR2_HAVE_DOT_CONFIG condition.

 > We have verified that $(TARGET_DIR) is only used within the
 > BR2_HAVE_DOT_CONFIG condition. Outside of this condition, such as in
 > the "clean" target, $(BASE_TARGET_DIR) is used.

 > Suggested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

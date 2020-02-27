From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Feb 2020 22:51:08 +0100
Subject: [Buildroot] [PATCH 1/2] package/pkg-generic.mk: simplify
 step_pkg_size
In-Reply-To: <20200226194345.1087529-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Wed, 26 Feb 2020 20:43:43 +0100")
References: <20200226194345.1087529-1-thomas.petazzoni@bootlin.com>
 <20200226194345.1087529-2-thomas.petazzoni@bootlin.com>
Message-ID: <87eeuflmwj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Use the same trick in step_pkg_size as the one used in check_bin_arch:
 > factorize the two $(filter ...) calls into one, checking in one step
 > the step and whether it's the beginning or end of the step.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jan 2019 11:51:32 +0100
Subject: [Buildroot] [PATCH] package/acpica: add missing dependencies
 for host variant
In-Reply-To: <20181228135502.24798-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 28 Dec 2018 14:55:02 +0100")
References: <20181228135502.24798-1-thomas.petazzoni@bootlin.com>
Message-ID: <87r2d3lk97.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Just like the target acpica package needs host-flex and host-bison,
 > the host variant also needs the same dependencies. This allows to fix
 > the build of "make host-acpica", which was detected thanks to
 > per-package directory support.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard

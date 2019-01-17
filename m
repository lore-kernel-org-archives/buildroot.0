From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 17 Jan 2019 22:33:43 +0100
Subject: [Buildroot] [PATCH v7 1/8] support/scripts/check-host-rpath:
 document existing functions
In-Reply-To: <20181228104335.22379-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 28 Dec 2018 11:43:28 +0100")
References: <20181228104335.22379-1-thomas.petazzoni@bootlin.com>
 <20181228104335.22379-2-thomas.petazzoni@bootlin.com>
Message-ID: <87pnsv6kaw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > As suggested by Arnout Vandecappelle, let's document the
 > elf_needs_rpath() and check_elf_has_rpath() functions, before we make
 > them a bit more complicated with per-package directory support.

 > Suggested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed after fixing the typo in the comment as pointed out by Yann,
thanks.

-- 
Bye, Peter Korsgaard

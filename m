From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 18 Feb 2014 22:58:22 +0100
Subject: [Buildroot] [PATCH v2 05/20] python3: add python -> python3
	symlink for the host variant
In-Reply-To: <1392756013-27757-6-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 18 Feb 2014 21:39:58 +0100")
References: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1392756013-27757-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87zjlo2idd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The target python3 depends on host-python3, but most of the scripts
 > call "python", so we need to ensure that $(HOST_DIR)/usr/bin/python
 > exists. This patch achieves this by creating a python -> python3
 > symbolic link in $(HOST_DIR), just like we are already doing for the
 > target Python 3.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard

From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Oct 2015 20:16:56 +0200
Subject: [Buildroot] [PATCH 4/7] configs: fix configurations that need
	host-dtc
In-Reply-To: <1443901457-7914-5-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 3 Oct 2015 20:44:14 +0100")
References: <1443901457-7914-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1443901457-7914-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <871tdajy7b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > olimex_a20_olinuxino_lime_defconfig and zedboard_defconfig use U-Boot
 > 2015.07, and they need host-dtc to build properly.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

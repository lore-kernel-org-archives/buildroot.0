From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 May 2018 17:54:07 +0200
Subject: [Buildroot] [PATCH next] usbutils: bump to version 010
In-Reply-To: <72cd45059f9374d5fba3544f26a2f0429f074274.1527597307.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 29 May 2018 15:35:07 +0300")
References: <72cd45059f9374d5fba3544f26a2f0429f074274.1527597307.git.baruch@tkos.co.il>
Message-ID: <87tvqq5ug0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add GPL-3.0 license for the lsusb.py script.
 > Update license file location.

 > The tar archive does not contain the license files from the git tree.
 > Add a patch adding the license files. This patch is not git formatted
 > because it only applies to the tar archive.

 > Upstream fixed tar archive generation for the next release.

 > Add license files hash.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to next, thanks.

Is lsusb.py still only compatible with python 2.x? If not, it would be
good to also keep it on the target when BR2_PACKAGE_PYTHON3 is enabled.

-- 
Bye, Peter Korsgaard

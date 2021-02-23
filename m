From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Feb 2021 14:05:17 +0100
Subject: [Buildroot] [PATCH] package/python-pyusb: bump to version 1.1.1
In-Reply-To: <20210222150023.21814-1-yegorslists@googlemail.com>
 (yegorslists's message of "Mon, 22 Feb 2021 16:00:23 +0100")
References: <20210222150023.21814-1-yegorslists@googlemail.com>
Message-ID: <87sg5nkk8i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > Along with the version bump the following changes were
 > needed to get the package built:

 > - since 1.1.1 PyUSB supports only Python3
 > - change download file name to lowercase
 > - the package now requires setuptools and setuptools_scm
 > - change LICENSE checksum as the copyright year changed to 2021

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard

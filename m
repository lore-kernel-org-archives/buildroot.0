From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 Jun 2014 09:17:41 +0200
Subject: [Buildroot] [PATCHv2] configs/calao_qil_a9260: fix kernel build
In-Reply-To: <1401744469-32558-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 2 Jun 2014 23:27:49 +0200")
References: <1401744469-32558-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <874n02tqay.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The calao_qil_a9260 was not specifying an explicit kernel version, so
 > it ended up downloading the latest kernel version, and therefore fail
 > to apply the patches. This commit changes the defconfig to used a
 > fixed kernel version, so that the patches apply properly. It fixes a
 > Jenkins build failure that has been occuring since quite some time.

 > While we're at it, also lock down the version of the kernel headers,
 > as noticed by Peter Korsgaard.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Oct 2017 23:43:05 +0200
Subject: [Buildroot] [PATCH] configs/galileo: CONFIG_LBDAF=y
In-Reply-To: <20170902081032.24935-1-sielicki@yandex.com> (Nicholas Sielicki's
 message of "Sat, 2 Sep 2017 03:10:32 -0500")
References: <20170902081032.24935-1-sielicki@yandex.com>
Message-ID: <878tgaydjq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nicholas" == Nicholas Sielicki <sielicki@yandex.com> writes:

 > Kernel help-text states, "The ext4 filesystem requires that this feature
 > be enabled <...> otherwise, it will refuse to mount in the read-write
 > mode any filesystems that use the huge_file feature, which is enabled by
 > default by mke2fs.ext4."

 > If the rootfs is to be (re)mounted rw at boot, this must be set for the
 > system to successfully come up.

 > Signed-off-by: Nicholas Sielicki <sielicki@yandex.com>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard

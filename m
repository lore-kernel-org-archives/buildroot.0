From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 May 2017 11:51:27 +0200
Subject: [Buildroot] how to install package ltp-testsuite outside of
	target directory
In-Reply-To: <8729016553E3654398EA69218DA29EEF15B9AEC2@cnshjmbx02> (YUAN
 Linyu's message of "Wed, 17 May 2017 09:17:05 +0000")
References: <8729016553E3654398EA69218DA29EEF15B99E23@cnshjmbx02>
 <8760gz7u5a.fsf@dell.be.48ers.dk>
 <8729016553E3654398EA69218DA29EEF15B9ADF2@cnshjmbx02>
 <87shk36ej9.fsf@dell.be.48ers.dk>
 <8729016553E3654398EA69218DA29EEF15B9AEC2@cnshjmbx02>
Message-ID: <87o9ur6cbk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "YUAN" == YUAN Linyu <Linyu.Yuan@alcatel-sbell.com.cn> writes:

Hi,

 >> The single rootfs assumption is quite deep in Buildroot and I haven't
 >> seen a design for how we could cleanly handle various rootfs splitups
 >> without introducing a lot of complexity, so don't expect Buildroot to
 >> officially support it in the near future.

> I am not try to create multiple rootfs, I just want to move ltp-testsuite
 > (or other package which have big size) from rootfs to another place, then
 > I can do operation like tar it or manual create another file system.

Yes, that is really what I mean with multiple filesystems. You want to
remove a part of the buildroot rootfs and store the data in another
filesystem.

-- 
Bye, Peter Korsgaard

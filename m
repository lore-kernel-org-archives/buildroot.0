From: YUAN Linyu <Linyu.Yuan@alcatel-sbell.com.cn>
Date: Wed, 17 May 2017 09:17:05 +0000
Subject: [Buildroot] how to install package ltp-testsuite outside of
	target directory
In-Reply-To: <87shk36ej9.fsf@dell.be.48ers.dk>
References: <8729016553E3654398EA69218DA29EEF15B99E23@cnshjmbx02>
 <8760gz7u5a.fsf@dell.be.48ers.dk>
 <8729016553E3654398EA69218DA29EEF15B9ADF2@cnshjmbx02>
 <87shk36ej9.fsf@dell.be.48ers.dk>
Message-ID: <8729016553E3654398EA69218DA29EEF15B9AEC2@cnshjmbx02>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> -----Original Message-----
> From: Peter Korsgaard [mailto:jacmet at gmail.com] On Behalf Of Peter
> Korsgaard
> Sent: Wednesday, May 17, 2017 5:04 PM
> To: YUAN Linyu
> Cc: buildroot at busybox.net
> Subject: Re: how to install package ltp-testsuite outside of target directory
>  > So buildroot will not provide an official solution to do such thing,
>  > right?
> 
> The single rootfs assumption is quite deep in Buildroot and I haven't
> seen a design for how we could cleanly handle various rootfs splitups
> without introducing a lot of complexity, so don't expect Buildroot to
> officially support it in the near future.
I am not try to create multiple rootfs, I just want to move ltp-testsuite
(or other package which have big size) from rootfs to another place, then
I can do operation like tar it or manual create another file system.

> 
> --
> Bye, Peter Korsgaard

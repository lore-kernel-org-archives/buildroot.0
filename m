From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 18 Jun 2008 09:16:26 +0200
Subject: [Buildroot] [PATCH] Fix proftpd compile with recent kernels.
In-Reply-To: <d6cda7730806172058v708be481y167b834a4367834b@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Wed\, 18 Jun 2008
	00\:58\:30 -0300")
References: <d6cda7730806172032n7a564bc7g409d2bbe18c1d471@mail.gmail.com>
	<d6cda7730806172058v708be481y167b834a4367834b@mail.gmail.com>
Message-ID: <87k5gnciwl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

 Thiago> *resubmit*
 Thiago> Missing rule to apply patch in .mk file and change patch to apply with -p1

 Thiago> It now works properly. Please, don't forget to:

 Thiago> svn add package/proftpd/proftpd-1.3.1*

 Thiago> It also seams that the bzero patch is no longer necessary
 Thiago> (built fine for me using atngw100_defconfig)

Thanks - Please don't include other stuff in your patches though
(u-boot)

-- 
Bye, Peter Korsgaard

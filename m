From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 10 Dec 2013 15:42:21 +0100
Subject: [Buildroot] [PATCH v5 1/1] ktap: new package
In-Reply-To: <CAAXf6LU_ia5PzN1MxVt9snUOcF5q983gR5VLy0ZDR8+qVPW9cA@mail.gmail.com>
 (Thomas De Schampheleire's message of "Tue, 10 Dec 2013 15:36:11
 +0100")
References: <1675197757.16219192.1386680505536.JavaMail.root@openwide.fr>
 <874n6g6d0r.fsf@dell.be.48ers.dk>
 <CAAXf6LU_ia5PzN1MxVt9snUOcF5q983gR5VLy0ZDR8+qVPW9cA@mail.gmail.com>
Message-ID: <87zjo84vjm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

 > The first seems to emphasize that we require a Linux kernel to be
 > built in buildroot, while the second one leaves it in the middle. For
 > packages that actually build kernel modules, like ktap, we really need
 > the kernel inside buildroot, right? Are there any packages that depend
 > on BR2_LINUX_KERNEL that do _not_ require an in-buildroot kernel?

I don't think so, as BR2_LINUX_KERNEL is the symbol to build a linux
kernel internally.


-- 
Bye, Peter Korsgaard

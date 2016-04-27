From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Apr 2016 22:40:33 +0200
Subject: [Buildroot] [git commit] configs/raspberrypi3: sync kernel
	version with rpi/rpi2
In-Reply-To: <571FD66D.9050305@beneth.fr> (=?utf-8?Q?=22Beno=C3=AEt?=
 Mauduit"'s message of "Tue, 26 Apr 2016 22:58:21 +0200")
References: <CALtfCQbtz27yZXAOf+rZpE7y1LOV5TzTT2e5dUbk7ov-RQEy5A@mail.gmail.com>
 <878u00o2oi.fsf@dell.be.48ers.dk>
 <CALtfCQbwAPAwPjyyoY6bLdzsg3i86ZrC8bQor1ycbx8VBKm9og@mail.gmail.com>
 <874maoo0al.fsf@dell.be.48ers.dk> <87wpnkmf65.fsf@dell.be.48ers.dk>
 <20160426213916.241241c7@gmx.net> <571FD66D.9050305@beneth.fr>
Message-ID: <87d1pa23b2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Beno?t" == Beno?t Mauduit <bmauduit@beneth.fr> writes:

Hi,

 > For information, I have successfully built a working Linux kernel for
 > rpi2 on top of the branch rpi-4.4.y.

 > BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="e63db5f23b77ba5e2fa7823e9b3254bb65358b69"
 > Do you think we can move to this branch ?

Ehh, but we are already using rpi-4.4.y? (3de2328 from April 21st) -
With that said, we can certainly move to e63db5. Care to send a patch to
update raspberry{,2,3}_defconfig?

-- 
Bye, Peter Korsgaard

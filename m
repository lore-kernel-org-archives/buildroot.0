From: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Date: Mon, 28 Jan 2019 09:34:51 -0200 (BRST)
Subject: [Buildroot] [PATCH 2/2] support/testing: add atop test
In-Reply-To: <87d0ohf92u.fsf@dell.be.48ers.dk>
References: <20190128021406.27477-1-ricardo.martincoski@gmail.com>
 <20190128021406.27477-2-ricardo.martincoski@gmail.com>
 <87d0ohf92u.fsf@dell.be.48ers.dk>
Message-ID: <1909116512.4141756.1548675291647.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

----- Original Message -----
> From: "Peter Korsgaard" <peter@korsgaard.com>
> Sent: Segunda-feira, 28 de janeiro de 2019 7:03:05
> Subject: Re: [PATCH 2/2] support/testing: add atop test

>>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:
[snip]
> > +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
> 
> Any specific reason for this old unsupported kernel version?

Not really. I copied from qemu_arm_vexpress_defconfig.


Regards,
Ricardo

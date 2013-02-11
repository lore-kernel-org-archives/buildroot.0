From: =?UTF-8?Q?Rafa=C5=82_Fabich?= <rafal.fabich@gmail.com>
Date: Mon, 11 Feb 2013 09:30:48 +0100
Subject: [Buildroot] [PATCH 1/1] Added local directory as soure of
	kernel code
In-Reply-To: <201302102150.20584.yann.morin.1998@free.fr>
References: <1360310725-6463-1-git-send-email-rafal.fabich@gmail.com>
 <1360310725-6463-2-git-send-email-rafal.fabich@gmail.com>
 <201302102150.20584.yann.morin.1998@free.fr>
Message-ID: <CAPRxd40kJatEqLkdpxAQ7qzeEpmothzitT-Nbm4HiFEat6=1gA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

On Sun, Feb 10, 2013 at 9:50 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> On Friday 08 February 2013 Rafal Fabich wrote:
> > In 'menuconfig' user can choose the local directory as a source of Linux
> > kernel code.
> > Useful during kernel drivers or modules development.
>
> Why not using the _OVERRIDE_SRCDIR mechanism:
>     $ export LINUX_OVERRIDE_SRCDIR=/path/to/your/kernel/tree
>

Good question.
Well, I added this to menuconfig because there is the place where
kernel source is configured. So, if it is possible to set a custom
tarball, then why not setting the local directory as well?
Correct me if I am wrong, but this would keep all in one place.
Anyway, I think it is good to have another method.

Best regards,
Rafal

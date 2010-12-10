From: Pkun <serj.kalichev@gmail.com>
Date: Fri, 10 Dec 2010 21:06:45 +0300
Subject: [Buildroot] [PATCH v3] fix iproute2 dependencies and define AR
 for iptables and iproute2
In-Reply-To: <201012101900.44789.yann.morin.1998@anciens.enib.fr>
References: <0e6c629d481e9024055833cf47d4543e0b1f2d76.1292000704.git.smiley73@users.sourceforge.net>
	<AANLkTimVB8tTYopQxQrzAXbQxhBygGZd6xDj0tUFeNjv@mail.gmail.com>
	<201012101900.44789.yann.morin.1998@anciens.enib.fr>
Message-ID: <AANLkTimG2EpcxdZqdCPuK+50mBtQ2igTFUdQdB3yrM=4@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2010/12/10 Yann E. MORIN <yann.morin.1998@anciens.enib.fr>

> Serj, Heiko, All,
>
> On Friday 10 December 2010 18:56:02 Pkun wrote:
> > Unpack the iptables and search for the $(AR) within the project. There is
> no
> > $(AR) at all.
>
> Yes there is:
>
>  cd iptables-1.4.10
>  ./configure
>  grep -r -E '\<AR\>' .
>  ---8<---
>  ./Makefile:AR = ar
>  ---8<---
>
> Regards,
> Yann E. MORIN.
>
>
It's a definition only. Where is it used?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101210/865cda71/attachment.html>

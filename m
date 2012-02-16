From: Ozgun <ozgun.gunay@gmail.com>
Date: Thu, 16 Feb 2012 08:46:44 +0200
Subject: [Buildroot] opencv with glibc
Message-ID: <CAPeX=+s4-ne+AtwxGUxLVqpN2j89ykB1sZfZsa1DovTKPDBkuw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I download my BR from standard tree.
My problem solved using "make distclean" instead of "make clean"

thanks




Date: Wed, 15 Feb 2012 22:26:03 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Ozgun <ozgun.gunay@gmail.com>
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] opencv with glibc
Message-ID: <20120215222603.6754b8e6@skate
>
Content-Type: text/plain; charset=UTF-8

Le Wed, 15 Feb 2012 21:35:25 +0200,
Ozgun <ozgun.gunay@gmail.com> a ?crit :

> My br doesn't have output/toolchainfile.cmake file

Which version of Buildroot are you using? Are you doing out-of-tree
build (if so, then the toolchainfile.cmake file is in the output
directory you selected with O=, not in output/).

Thomas
--
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120216/d7f30788/attachment-0001.html>

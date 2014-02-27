From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Fri, 28 Feb 2014 00:04:36 +0100
Subject: [Buildroot] [PATCH v2] libdrm: bump to 2.4.52 and remove
	useless dependencies on libpciaccess
References: <1393539908-14365-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
Message-ID: <4ts4uaxbmu.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sebastien Bourdelin
<sebastien.bourdelin@savoirfairelinux.com>
wrote in
news:1393539908-14365-1-git-send-email-sebastien.bourdelin at savoirfairelinux
.com: 

> Since the version 2.4.32, libdrm no longer requires dependencies on
> the libpciaccess unless for the intel-dri.

Hi,

please have a look at this patch series addressing the same topic:

http://patchwork.ozlabs.org/patch/317523/
http://patchwork.ozlabs.org/patch/317522/
http://patchwork.ozlabs.org/patch/317524/

Regards, Bernd

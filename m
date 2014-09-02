From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 02 Sep 2014 22:28:06 +0200
Subject: [Buildroot] [PATCH] xserver_xorg-server: add patch to fix build
	issue on gcc <= 4.5
References: <1409688388-5974-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <XnsA39CE48F83EEDberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in
news:1409688388-5974-1-git-send-email-thomas.petazzoni at free-electrons.com: 

> Fixes:
> 
>   http://autobuild.buildroot.org/results/e28/e28080f53f33b66fbb244e30a040
>   aaf0a458bce5/ 

Hi,

alternatively something like this can be used:
http://lists.x.org/archives/xorg-devel/2014-March/041494.html

I think it also fixed the problem. I discovered this patch in my local
buildroot patch queue, dating back to Aug 3rd... It seems I lacked time to
test it, sorry. 

Regards, Bernd

From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 12 Dec 2011 22:12:15 +0100
Subject: [Buildroot] [PATCH 1/1] libosip2 : bump version. download no
	longer available.
In-Reply-To: <87liqhu8tr.fsf@macbook.be.48ers.dk>
References: <1323701031-27344-1-git-send-email-sagaert.johan@skynet.be>
 <87liqhu8tr.fsf@macbook.be.48ers.dk>
Message-ID: <6217784DAF8949E8B93FFF9B8CF9FF4B@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I had the libosip2 3.5.0 in my BUILDROOT_DL_DIR for a while so I didn't notice it was removed from the download site.

Tnx for fixing.

Johan

-----Oorspronkelijk bericht-----
Van: Peter Korsgaard [mailto:jacmet at gmail.com] Namens Peter Korsgaard
Verzonden: maandag 12 december 2011 16:08
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: [PATCH 1/1] libosip2 : bump version.

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Bump libosip2 version since libeXosip2 depends on this.

Debian seems to have moved on..

>>> libosip2 3.5.0 Downloading
--2011-12-12 16:05:45--  http://ftp.debian.org/debian/pool/main/libo/libosip2/libosip2_3.5.0.orig.tar.gz
Resolving ftp.debian.org (ftp.debian.org)... 130.89.148.12, 2001:610:1908:b000::148:12
Connecting to ftp.debian.org (ftp.debian.org)|130.89.148.12|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2011-12-12 16:05:46 ERROR 404: Not Found.

Either use the real upstream or change to a stable snapshot.debian.org
URL.

-- 
Bye, Peter Korsgaard

From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 12 Dec 2011 16:08:00 +0100
Subject: [Buildroot] [PATCH 1/1] libosip2 : bump version.
In-Reply-To: <1323701031-27344-1-git-send-email-sagaert.johan@skynet.be>
 (Sagaert Johan's message of "Mon, 12 Dec 2011 15:43:51 +0100")
References: <1323701031-27344-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <87liqhu8tr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

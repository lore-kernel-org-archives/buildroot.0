From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 28 Apr 2015 22:39:10 +0200
Subject: [Buildroot] [PATCH] freerdp: fix build with uclibc snapshot and
	uclibc-ng
References: <6282ca49ebfb65c9399eeedcac6a3d69038d2690.1430250053.git.baruch@tkos.co.il>
Message-ID: <XnsA48AE66F8143FberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch Siach <baruch@tkos.co.il> wrote in
news:6282ca49ebfb65c9399eeedcac6a3d69038d2690.1430250053.git.baruch at tkos.co
.il: 

> uclibc snapshot and uclibc-ng add support for the eventfd_{read,write}
> glibc extensions. Refine our uClibc support patch to take this into
> account, based on upstream suggested PR.

Hi,

what about adding eventfd_read() and eventfd_write() to 
package/uclibc/0.9.33.2/? This function is needed by upcoming Kodi 15.0 
Isengard as well and will be part[1] of my next RFC-patch series when beta1 
of the next Kodi version will be released.

Regards, Bernd

[1] In fact it is the 2nd try ;) http://patchwork.ozlabs.org/patch/402957/

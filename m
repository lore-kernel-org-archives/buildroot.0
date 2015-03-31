From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 31 Mar 2015 18:59:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/libseccomp: needs headers >=
	3.12
References: <1427819637-2471-1-git-send-email-bernd.kuhls@t-online.de>
 <20150331165723.GP12479@tarshish>
Message-ID: <XnsA46EC1420D725berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch Siach <baruch@tkos.co.il> wrote in 
news:20150331165723.GP12479 at tarshish:

> Can't we limit the 3.12 headers dependency to BR2_aarch64?

Hi Baruch,

no, the build errors are not limited to aarch64: 
http://autobuild.buildroot.net/?reason=libseccomp-v2.2.0

Regards, Bernd

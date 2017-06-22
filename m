From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Thu, 22 Jun 2017 10:55:19 +0300
Subject: [Buildroot] [PATCH 1/2] xr819-xradio: new package
In-Reply-To: <20170621224139.720d19cc@windsurf>
References: <20170618184200.31167-1-geomatsi@gmail.com>
 <20170618184200.31167-2-geomatsi@gmail.com>
 <20170621224139.720d19cc@windsurf>
Message-ID: <20170622075519.qp2nbrgekpbhc72i@bars>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > +comment "xradio wireless driver needs a Linux kernel to be built"
> 
> The comment should mention the package name as-is, i.e:
> 
> comment "xr819-xradio needs a Linux kernel to be built.
> 
> I've fixed both issues and applied. Thanks!


Hello Thomas,

Thanks for taking care and fixing those patch issues !

Could you please also comment on the question regarding firmware binaries
from the cover email to this patch series. For convenience
I repeat it here:

This series does not include firmware since I have certain doubts regarding
firmware packaging. IIUC normally xr819 firmware is extracted from vendor's SDK.
Extracted firmware can be obtained from various places on the web,
e.g. from Armbian project.

Would it be alright to point at Armbian github in firmware package ?

Regards,
Sergey

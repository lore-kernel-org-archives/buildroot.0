From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Apr 2021 10:07:01 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2021-04-04
In-Reply-To: <20210405093012.2186140228@smtp2.osuosl.org>
References: <20210405093012.2186140228@smtp2.osuosl.org>
Message-ID: <20210406100701.386076e0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 05 Apr 2021 09:30:00 -0000
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

>                          grub2 | CVE-2019-14865   | https://security-tracker.debian.org/tracker/CVE-2019-14865  
>                          grub2 | CVE-2020-14372   | https://security-tracker.debian.org/tracker/CVE-2020-14372  
>                          grub2 | CVE-2020-15705   | https://security-tracker.debian.org/tracker/CVE-2020-15705  

I sent a patch for those 3 CVEs, as we can safely ignore them.

>                           shim | CVE-2014-3675    | https://security-tracker.debian.org/tracker/CVE-2014-3675   
>                           shim | CVE-2014-3676    | https://security-tracker.debian.org/tracker/CVE-2014-3676   

These ones are fixed in upstream commit
e253c2a2c07bc526de1528ed9839b2b584025fa2, which is in shim since
version 0.8 (we are using version 15).

>                           shim | CVE-2014-3677    | https://security-tracker.debian.org/tracker/CVE-2014-3677   

This one is fixed in upstream commit
034466b7734a2749346151d903bbd7c8a1288db1, which is also in shim since
version 0.8.

I have notified NVD maintainers about this.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

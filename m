From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 26 Dec 2017 12:44:05 +0100
Subject: [Buildroot] [PATCH v2] package/mfgtools: bump to 0.02
In-Reply-To: <20171225143635.12778-1-romain.naour@gmail.com>
References: <20171225143635.12778-1-romain.naour@gmail.com>
Message-ID: <20171226114405.dhdenhezgnf6mjvx@t450s.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Mon, Dec 25, 2017 at 03:36:35PM +0100, Romain Naour wrote:
> Bump mfgtools to include the fix [1] for the C++ build issue reported
> by the autobuilders.
> 
> This bump include only 4 small commit fixing memory leak and this
> build issue.
> 
> Remove CPOL.htm (removed upstream) from MFGTOOLS_LICENSE_FILES but CPOL
> license is still valid.
> Add the README.txt file to MFGTOOLS_LICENSE_FILES since it contains
> licensing informations:
> 
> Licenses:
> - CPOL: MfgToolLib/XmlLite.CPP and XmlLite.h
> - BSD: Others.
> 
> Add license file hash.
> 
> [1] https://github.com/codeauroraforum/mfgtools/commit/b370a43e548440025d274ff2abbb25342bbaa78c
> 
> Fixes:
> http://autobuild.buildroot.net/results/7c2bbbe13ab315684f3502afd96958a76879b1d5
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
> This patch should be backported to stable branches 2017.02 and 2017.08.
> 
> v2: update url (Baruch)
>     add README.txt to MFGTOOLS_LICENSE_FILES (Baruch)

Thanks for taking care of it.
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Note that all the NXPMicro repositories have moved to CodeAurora (to be
Qualcomm-friendly) and that other projects using old URL will be
updated in my next update series (within the next couple of weeks).

Regards,
Gary

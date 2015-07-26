From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 23:34:03 +0200
Subject: [Buildroot] [PATCH 00/12] Google Code: Change site
In-Reply-To: <1437943118-18060-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1437943118-18060-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20150726233403.7aecead1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun, 26 Jul 2015 22:38:26 +0200, Maxime Hadjinlian wrote:

> Some projects have already moved on, this series bump/change the site of
> theses projects.
> 
> A few are still on Google Code, they seems pretty abandonned, so a
> decision will be needed regarding theses. Switch to Alioth ? Look for a
> fork ?

With still have 1.5 years ahead of us before they go offline. So I
would suggest that we could to monitor those projects in the coming
months, and only start taking radical decision in 9-12 months.

> Maxime Hadjinlian (12):
>   zxing_cpp: New package
>   yaml-cpp: Bump version and change site
>   libass: Bump version and change site
>   explorercanvas: Bump version and change site
>   libfreefare: Bump version and change site
>   libiscsi: Bump version
>   libllcp: Bump version and change site
>   libnfc: Bump version and change site
>   python-pycrc16: Change site
>   python-dpkt: Bump version and change site
>   python-pypcap: Bump version and change site
>   qextserialport: Bump version and change site

I've applied all except the zxing_cpp patch. But I had to do some fixes
for some of them, so I'll reply to the specific patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 15:45:44 +0200
Subject: [Buildroot] [PATCH 00/21] Use SPDX short identifier for license
 string
In-Reply-To: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <20170401154544.5d854f5b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Mar 2017 19:13:29 +0530, Rahul Bedarkar wrote:

> Rahul Bedarkar (21):
>   docs/manual: refer to SPDX License List
>   package: use SPDX short identifier for GPLv1/GPLv1+
>   boot, linux, package: use SPDX short identifier for GPLv2/GPLv2+
>   boot, package: use SPDX short identifier for GPLv3/GPLv3+
>   boot, package: use SPDX short identifier for LGPLv2.1/LGPLv2.1+
>   package: use SPDX short identifier for LGPLv3/LGPLv3+
>   package: use SPDX short identifier for AGPLv3
>   package: use SPDX short identifier for LGPLv2/LGPLv2+
>   boot, package: use SPDX short identifier for BSD-3c
>   boot, package: use SPDX short identifier for BSD-2c
>   package: use SPDX short identifier for BSD-4c
>   package: use SPDX short identifier for Apache version 2
>   package: use SPDX short identifier for MPL family licenses
>   package: use SPDX short identifier for GFDL family licenses
>   freeswitch: use SPDX short identifier for license strings
>   package: use SPDX short identifier for AFLv2.1
>   package: use SPDX short identifier for Boost Software License 1.0
>   packages: use SPDX short identifier for zlib license
>   Makefile: use SPDX short identifier for Buildroot license
>   scripts/scancpan: use SPDX short identifier for license
>   scripts/scanpypi: use SPDX short identifier for license

Thanks, I've applied the entire series. It would be nice to re-do a
final check that no packages merged between the moment you generated
the patch series and the moment was merged is not using bogus license
codes.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

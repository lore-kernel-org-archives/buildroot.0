From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Oct 2017 18:24:29 +0100
Subject: [Buildroot] [PATCH v5 1/2] boinc: new package
In-Reply-To: <20171029161256.18607-1-bernd.kuhls@t-online.de>
References: <20171029161256.18607-1-bernd.kuhls@t-online.de>
Message-ID: <20171029182429.4b25cd5e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 Oct 2017 17:12:55 +0100, Bernd Kuhls wrote:
> From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
> Open-source software for volunteer computing and grid computing.
> 
> Use the idle time on your computer to cure diseases, study global
> warming, discover pulsars, and do many other types of scientific
> research.
> 
> https://boinc.berkeley.edu
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
> [Bernd v5:
> - bumped to version 7.8.3
> - removed patches which where applied upstream
> - added myself to DEVELOPERS as well]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> Changes v3 -> v4 (after review of Thomas Petazzoni):
>  - Add DEVELOPERS entry
>  - Fix licence: LGPL-3.0+ instead of LGPLv3
>  - Fix static build: set back --enable-dynamic-client-linkage

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

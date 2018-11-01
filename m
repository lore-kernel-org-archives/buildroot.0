From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Nov 2018 22:43:30 +0100
Subject: [Buildroot] [PATCH v4,
 1/1] bdwgc: add optional cplusplus support
In-Reply-To: <20181025191316.8187-1-fontaine.fabrice@gmail.com>
References: <20181025191316.8187-1-fontaine.fabrice@gmail.com>
Message-ID: <20181101224330.0681c128@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 Oct 2018 21:13:16 +0200, Fabrice Fontaine wrote:
> Use CFLAGS_EXTRA to pass C and C++ flags in a single variable
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v3 -> v4 (after review of Baruch Siach):
>  - Move CFLAGS_EXTRA assignment before ifeq statements

Actually, I would have preferred to use CFLAGS/CXXFLAGS, to only use
standardized autoconf/automake variables, instead of CFLAGS_EXTRA. But
apparently, the other reviewers disagree with me, so I've applied your
patch to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

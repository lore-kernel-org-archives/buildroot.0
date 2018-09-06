From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Sep 2018 09:42:42 +0200
Subject: [Buildroot] [PATCH v5 0/3] Add tainting support to buildroot
In-Reply-To: <1536186133-9933-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1536186133-9933-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20180906094242.7c07b6b3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  6 Sep 2018 00:22:10 +0200, Angelo Compagnucci wrote:
> Packages that need to resolve dependencies internally
> and use a package manager would harm the reproducibility
> of a build, moreover they escape the legal infrastructure
> not giving enough informations on licensing.
> 
> This patch adds a tainting mechanism in the form of a
> variable FOO_TAINTS that can be used to signal that
> a package harms the reproducibility or licensing under
> certain conditions.
> 
> This opens the door to include per language dependency
> managers in buildroot.
> 
> Angelo Compagnucci (3):
>   Makefile: add tainting support
>   docs/manual: adding infos about tainting
>   package/nodejs: taint the build on external modules

It would be good to include a changelog of what has been changed
between the different iterations of your series.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

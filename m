From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Aug 2017 15:54:06 +0200
Subject: [Buildroot] [PATCH 1/2] cc-tool: pass -latomic in LIBS
In-Reply-To: <20170820133416.11231-1-thomas.petazzoni@free-electrons.com>
References: <20170820133416.11231-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170820155406.1884dcfd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 Aug 2017 15:34:15 +0200, Thomas Petazzoni wrote:

>  .../0003-Makefile.am-do-not-overwrite-LIBS.patch   | 49 ++++++++++++++++++++++

This patch has been submitted to some "upstream" at
https://github.com/dashesy/cc-tool/pull/4. The real upstream at
SourceForge seems to be dead, while this repo has seen commits last
year.

While at it, I also submitted another patch we had on cc-tool:
https://github.com/dashesy/cc-tool/pull/5.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

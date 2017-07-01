From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 18:26:57 +0200
Subject: [Buildroot] [PATCH 0/7 v4] tools: add a directory to contain
 usefull user-facing tools
In-Reply-To: <cover.1498919458.git.yann.morin.1998@free.fr>
References: <cover.1498919458.git.yann.morin.1998@free.fr>
Message-ID: <20170701182657.7cf6290e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  1 Jul 2017 16:31:03 +0200, Yann E. MORIN wrote:

> Yann E. MORIN (7):
>       tools: move test-pkg out of support/scripts
>       tools: move get-developers out of support/scripts/
>       tools: move check-package out of support/scripts/
>       tools: move size-stat-compare out of support/scripts/
>       tools: move scancpan out of support/scripts/
>       tools: move scanpypi out of support/scripts/
>       tools: new tool to filter the output of make

All applied. As discussed, I have changed the name of the directory
from "tools/" to "utils/" in order to avoid the tab-completion conflict
with the top-level "toolchain/" folder.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jun 2015 09:44:48 +0200
Subject: [Buildroot] [PATCH] package/openvmtools: move files up from
 unnecessary subdirectory
In-Reply-To: <1434526416-62466-1-git-send-email-kaszak@gmail.com>
References: <1434526416-62466-1-git-send-email-kaszak@gmail.com>
Message-ID: <20150617094448.01ac6010@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Karoly Kasza,

On Wed, 17 Jun 2015 09:33:36 +0200, Karoly Kasza wrote:
> The Open-vm-tools package is now distributed from GitHub and a new
> subdirectory was introduced, which breaks the Buildroot process.
> 
> This patch moves everything up from the new subdirectory after
> extraction, making Buildroot once again able to run.
> 
> Fixes:
> 
> http://autobuild.buildroot.net/results/bfd10c8d454a2686ebb1c4afdb49c55e39a9dd67/
> 
> Signed-off-by: Karoly Kasza <kaszak@gmail.com>

Or you could use:

OPENVMTOOLS_SUBDIR = open-vm-tools

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

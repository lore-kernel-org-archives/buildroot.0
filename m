From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Apr 2016 22:46:30 +0200
Subject: [Buildroot] [PATCH v2] owfs: new package
In-Reply-To: <1456182471-20883-1-git-send-email-arnout@mind.be>
References: <1456182471-20883-1-git-send-email-arnout@mind.be>
Message-ID: <20160421224630.6ff698d7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Feb 2016 00:07:51 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> All modules are always enabled when their dependencies are satisfied.
> 
> tcl doesn't work because the tclConfig.sh installed by our tcl package
> is wrong: it adds -I/usr/include.
> 
> perl doesn't work out of the box, I didn't investigate.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Fails to build with some compilers due to the usage of #pragma:

  http://autobuild.buildroot.org/results/d5d/d5d57843d0bf0060eb77028434d7313e2095c255/build-end.log

Could you have a look? Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

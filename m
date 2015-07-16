From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jul 2015 23:42:08 +0200
Subject: [Buildroot] [PATCH] setool: Add missing bison dependency
In-Reply-To: <1436981464-55916-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1436981464-55916-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <20150716234208.23256cf8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Wed, 15 Jul 2015 12:31:04 -0500, Clayton Shotwell wrote:
> The setools package needs the yacc utility which is part of the bison
> package to build.
> 
> Fixes http://autobuild.buildroot.net/results/8f9/8f95e83411552397ca29e9aee5c457a1a762b364/
> 
> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> ---
>  package/setools/setools.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Minor nit in the commit title: s/setool/setools/. Committed with that
fixed, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Mar 2015 16:37:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/powertop: needs gettextize,
 2nd try
In-Reply-To: <1427466030-10274-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427466030-10274-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150327163705.73e4bd34@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri, 27 Mar 2015 15:20:30 +0100, Bernd Kuhls wrote:
> If host-gettext was compiled before powertop it is picked up by autoreconf which
> leads to a broken compile. To fix this unconditionally include host-gettext as
> dependency and move
> 
> POWERTOP_GETTEXTIZE = YES
> 
> outside the if-clause for BR2_NEEDS_GETTEXT
> 
> Fixes
> http://autobuild.buildroot.net/results/24e/24e312271cf07a8dd966b43f153a06ddc858a786/
> http://autobuild.buildroot.net/results/511/511a1c76bfd0ebf637e5abcd6fecc4d6a683ed3e/
> http://autobuild.buildroot.net/results/652/65246f6f71e67c2637efbe8bb6e501750629d5fb/
> 
> and many others
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 16:19:11 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/libfribidi: remove optional
 dependency to libglib
In-Reply-To: <20161030172918.29960-1-bernd.kuhls@t-online.de>
References: <20161030172918.29960-1-bernd.kuhls@t-online.de>
Message-ID: <20161101161911.5c419b22@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Oct 2016 18:29:18 +0100, Bernd Kuhls wrote:
> Fixes vdr compile error:
> http://autobuild.buildroot.net/results/725/7252decffe29e19051eed0554786651aee216573/
> 
> Instead of fixing fribidi.pc or adding optional CFLAGS to the vdr
> package we remove the optional libglib dependency because it does not
> contain "any thing substantial" as pointed out in an pull request sent
> upstream: https://github.com/behdad/fribidi/pull/14
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v3: instead of patching libfribidi we force glib=no (Thomas)
> v2: added patch 0003 to fix fribidi.pc

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

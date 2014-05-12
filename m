From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 May 2014 19:56:12 +0200
Subject: [Buildroot] [PATCH v6 00/32] xbmc: bump version to 13.0-Gotham
In-Reply-To: <1399716164-6452-1-git-send-email-bernd.kuhls@t-online.de>
References: <1399716164-6452-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140512195612.0e26443a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 10 May 2014 12:02:12 +0200, Bernd Kuhls wrote:

> the patch series combines my latest patches to bump xbmc.
> It also adds uClibc support to xbmc, a mesa3d version bump
> and several new packages to support the new xbmc release
> along with libva to get the best out of Intel systems.

Since we're approaching -rc1, Peter is no longer going to merge major
patches or big version bumps. However, it seems like your patch series
is mixing build fixes for existing issues (which can and should be
merged during the -rc cycle) and major version bumps or new features.

It would be nice if you could split it in two patch series, one with
the fixes only (to be applied during the -rc cycle) and one with the
major changes changes (which will be applied in the 'next' branch, and
therefore ultimately released in 2014.08). Of course, the latter branch
can be based on the former.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

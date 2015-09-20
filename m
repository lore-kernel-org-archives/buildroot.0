From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Sep 2015 14:59:18 +0200
Subject: [Buildroot] [PATCH] package/texinfo: remove package
In-Reply-To: <1441810885-58227-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1441810885-58227-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150920145918.47122142@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 9 Sep 2015 16:01:25 +0100, Vicente Olivert Riera wrote:
> Having checked that binutils doesn't need to depend on host-texinfo...
> 
>   http://patchwork.ozlabs.org/patch/515914/
> 
> ...and having fixed gdb to not build the documentation...
> 
>   http://patchwork.ozlabs.org/patch/515821/
> 
> ...we can now safely remove this host package since there aren't any
> packages depending on it.
> 
> [Note: this patch needs on http://patchwork.ozlabs.org/patch/515821/]

This is typically the kind of note that could go below the "---" marker.

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

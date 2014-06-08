From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 18:46:34 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/trace-cmd: bump to version
 2.3.2
In-Reply-To: <1402245690-21415-1-git-send-email-romain.naour@openwide.fr>
References: <1402245690-21415-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20140608184634.1462bc8c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sun,  8 Jun 2014 18:41:30 +0200, Romain Naour wrote:
> The first patch "use-pkg-config-instead-of-python-config" has been applied
> upstream.
> 
> The flag _GNU_SOURCE is now always defined in Makefile, so it can be removed
> from trace-cmd.mk
> 
> CPPFLAGS are appended to CFLAGS and are used to add extra flags, but the flag
> _LARGEFILE64_SOURCE in TARGET_CPPFLAGS is already defined in source files,
> which causes a build error. As for CFLAGS, we fix this by filtering out our
> definition of _LARGEFILE64_SOURCE from the CPPFLAGS before passing them to the
> trace-cmd Makefile.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
> v2: Remove _LARGEFILE64_SOURCE from CPPFLAGS (Thomas P)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

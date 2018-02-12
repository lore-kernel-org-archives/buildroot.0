From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Feb 2018 16:54:03 +0100
Subject: [Buildroot] [PATCH v3 1/1] LIBLO : bump version to 0.29
In-Reply-To: <1518438804-7961-1-git-send-email-alexbaldwinmusic@gmail.com>
References: <1518438804-7961-1-git-send-email-alexbaldwinmusic@gmail.com>
Message-ID: <20180212165403.296e993c@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Feb 2018 13:33:24 +0100, Alex B wrote:
> From: Alex <alexbaldwinmusic@gmail.com>
> 
> Starting from version 0.28, C++ wrappers are provided as well. The configure
> script appropriately detects the availability of a C++ compiler so no Buildroot
> changes are needed for this.
> 
> Building fails with --enable-ipv6 so --disable-ipv6 is needed in CONF_OPTS.
> This is known by liblo developers and building without ipv6 support is recomennded.
> 
> werror is kept on, so disable this with --disable-werror.
> 
> Patch to fix werror about redirect from sys/poll.h to poll.h
> 
> Liblo use's atomics, some architectures need explicit linking with libatomic. Added
> link to reflect this.
> 
> Included hash for license files.
> 
> Signed-off-by: Alex Baldwin <alexbaldwinmusic@gmail.com>

The liblo package has already been merged in the 'next' branch. So if
you want to send fixes, please send a patch on top of the current
'next' branch, i.e an incremental patch on top of what has already been
merged.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com

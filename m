From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Aug 2013 12:11:39 +0200
Subject: [Buildroot] [PATCH] Fix bug with dependencies of *-rebuild and
 *-reconfigure
In-Reply-To: <1368458741-8838-1-git-send-email-jezz@sysmic.org>
References: <1368458741-8838-1-git-send-email-jezz@sysmic.org>
Message-ID: <20130813121139.28a491d8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Mon, 13 May 2013 17:25:41 +0200, J?r?me Pouiller wrote:
> If targets $PKG-rebuild or $PKG-reconfigure are launched on a not fully built
> directory, Buildroot finish build of all packages instead of only build asked
> package.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Applied to the next branch, after rewording the commit message. This
patch is not fixing a bug at all, it's changing what was an intended
behavior.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

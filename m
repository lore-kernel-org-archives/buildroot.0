From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Jul 2018 14:28:32 +0200
Subject: [Buildroot] [git commit branch/2018.05.x]
 package/wireless-regdb: bump version to 2018.05.31
In-Reply-To: <20180720221609.BE06A8A295@busybox.osuosl.org>
References: <20180720221609.BE06A8A295@busybox.osuosl.org>
Message-ID: <20180723142832.379d74fb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 21 Jul 2018 00:20:58 +0200, Peter Korsgaard wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=eece13dcecdfc9dd283c068ec64000edb5fb09e4
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x
> 
> Added license hash, updated project URL, old site is dead.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> (cherry picked from commit 54917abdd74158298fd848a58117c796c641a130)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

I'm wondering why you backported this change. Indeed, the backport of
"wireless-regdb: add  regulatory.db[.p7s] to /lib/firmware" broke the
build of wireless-regdb on 2018.05.x, but perhaps the right thing to do
was to revert rather than bump wireless-regdb ?

In any case, the 2018.05.1 currently has a broken wireless-regdb
package because of this: your backport of the wireless-regdb bump has
been done after the 2018.05.1 tag.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 May 2018 22:40:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/vlc: fix build with updated x264
In-Reply-To: <20180501062345.4217-1-bernd.kuhls@t-online.de>
References: <20180501062345.4217-1-bernd.kuhls@t-online.de>
Message-ID: <20180501224015.6eb90d2a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Tue,  1 May 2018 08:23:45 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/909/909d4c1b4bf8b3135607025e12363db1b2196011/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/vlc/0013-x264.patch | 208 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 208 insertions(+)
>  create mode 100644 package/vlc/0013-x264.patch

I've applied, and then pushed a commit that changes all VLC patches to
be Git formatted. Please always use Git formatted patches for packages
that use Git as their upstream version control system.

For VLC, the repository at
https://git.videolan.org/?p=vlc/vlc-2.2.git;a=summary has a 2.2.8 tag,
and the new stack of patches applies on this Git tag.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

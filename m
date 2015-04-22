From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 23:47:44 +0200
Subject: [Buildroot] [PATCH 1/2] package/vlc: use only glesv2, not glesv1
In-Reply-To: <1429737809-17368-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429737809-17368-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150422234744.411c550e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed, 22 Apr 2015 23:23:28 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/0be/0bee8646c2dd7dd2c201ee2986f3e802277314a5/
> http://autobuild.buildroot.net/results/64a/64a1a6d39b72b9dec4231b9f28ca14b38989d7df/
> http://autobuild.buildroot.net/results/b6b/b6b66e0b24d985462ca8dbefedd740453ca42293/
> http://autobuild.buildroot.net/results/497/4976f5e9dc53e6f9f29d9d45f0fb9bd42c7ab1ea/
> 
> and many others
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/vlc/vlc.mk |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Both patches applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

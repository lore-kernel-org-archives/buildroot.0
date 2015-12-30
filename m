From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 15:58:37 +0100
Subject: [Buildroot] [PATCH 2/3] vboot-utils: ssize_t needs unistd.h
In-Reply-To: <8b4aafb03aca6c3b763bd90c18a601fbf3b302f1.1451483256.git.alex.suykov@gmail.com>
References: <cover.1451483256.git.alex.suykov@gmail.com>
 <8b4aafb03aca6c3b763bd90c18a601fbf3b302f1.1451483256.git.alex.suykov@gmail.com>
Message-ID: <20151230155837.575b899c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Wed, 30 Dec 2015 16:05:41 +0200, Alex Suykov wrote:
> Fixes
> http://autobuild.buildroot.net/results/95c8708411fbb116f313a0fdeccacf92cf9e3d8d/
> http://autobuild.buildroot.net/results/cf4aa60f9fc9c48ff13d3233994b77b7c0950afe/
> http://autobuild.buildroot.net/results/6f7dcafde693f06dfc88c922c5f8dd70ae2e30b5/
> http://autobuild.buildroot.net/results/a2e95784d32c8842f6947801fd0d8c48f68b84e2/
> http://autobuild.buildroot.net/results/f69ae4c9eee27df43389ae76048fb4ddd5a3eca6/
> 
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> ---
>  package/vboot-utils/0002-ssize-t.patch | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 package/vboot-utils/0002-ssize-t.patch

Also applied, with same comments: a Git formatted patch would have been
better, and if you can please submit upstream.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Jan 2017 13:20:04 +1100
Subject: [Buildroot] [PATCH] perl: fix static build with gdbm + gettext
In-Reply-To: <20170117150403.11677-1-francois.perrad@gadz.org>
References: <20170117150403.11677-1-francois.perrad@gadz.org>
Message-ID: <20170118132004.25b03576@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Jan 2017 16:04:03 +0100, Francois Perrad wrote:
> see http://autobuild.buildroot.org/results/d1f/d1f133ca3693b6653eed4fc513effc0bbdcfd9c9/
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  .../0001-fix-static-build-with-gdbm-gettext.patch    | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 package/perl/0001-fix-static-build-with-gdbm-gettext.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

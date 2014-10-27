From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Oct 2014 17:50:17 +0100
Subject: [Buildroot] [git commit] subversion: needs sqlite and pkg-config
In-Reply-To: <20141027164208.8EC20B10EA@busybox.osuosl.org>
References: <20141027164208.8EC20B10EA@busybox.osuosl.org>
Message-ID: <20141027175017.212d8da0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Mon, 27 Oct 2014 17:41:42 +0100, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=97c5d445202b082d0bb390a8c395dacb09942416
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Fixes:
> http://autobuild.buildroot.net/results/de2/de243c429c1e443efdbba82a860dbb7a03d5b746/
> http://autobuild.buildroot.net/results/40c/40ce377893789883503deaa57912b87d2e0192e8/
> http://autobuild.buildroot.net/results/134/13449cd77fbbd1c2b21d04b1fc866a086d915353/
> http://autobuild.buildroot.net/results/e3f/e3fc33177eef955830a7be68e7b23503fd1d9ebe/
> and others.
> 
> Also add the missing 'select' statements for apr, expat and zlib to match
> the .mk file.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/subversion/Config.in     |    4 ++++
>  package/subversion/subversion.mk |    2 +-
>  2 files changed, 5 insertions(+), 1 deletions(-)

This was already taken care of by a patch from Gustavo:
http://patchwork.ozlabs.org/patch/403623/. I've marked it as Superseded.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

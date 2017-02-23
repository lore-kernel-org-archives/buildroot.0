From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 22:22:46 +0100
Subject: [Buildroot] [PATCH next] gdk-pixbuf: bump to version 2.36.5
In-Reply-To: <20170222191408.4273-1-gustavo@zacarias.com.ar>
References: <20170222191408.4273-1-gustavo@zacarias.com.ar>
Message-ID: <20170223222246.0b5e3612@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Feb 2017 16:14:08 -0300, Gustavo Zacarias wrote:
> This release needs a new tweak regarding loaders.cache - it's now used
> to build the thumbnailer.
> Since we already generate it using the host variant for the target we
> can re-use this for the build step.
> It's not necessary to used the tweaked version since the build one is
> only used to account for mime types, not the plugins/loaders themselves.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gdk-pixbuf/gdk-pixbuf.hash |  4 ++--
>  package/gdk-pixbuf/gdk-pixbuf.mk   | 11 ++++++++++-
>  2 files changed, 12 insertions(+), 3 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 11:43:32 +0200
Subject: [Buildroot] [PATCH] packages/*.mk: Remove duplicate options
In-Reply-To: <1413656413-22546-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1413656413-22546-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141019114332.1a3cc1b3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sat, 18 Oct 2014 20:20:13 +0200, Maxime Hadjinlian wrote:
> These flags are already defined in pkg-autotools.mk.
> There is no need to have them twice.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/audiofile/audiofile.mk           | 2 +-
>  package/libexif/libexif.mk               | 1 -
>  package/memcached/memcached.mk           | 2 +-
>  package/opus/opus.mk                     | 3 +--
>  package/x11r7/xlib_libXaw/xlib_libXaw.mk | 1 -
>  5 files changed, 3 insertions(+), 6 deletions(-)

I've changed the = back to += in the opus package, as noted by Yann,
and committed your patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

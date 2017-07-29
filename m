From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jul 2017 23:02:53 +0200
Subject: [Buildroot] [PATCH v2] libcgi: bump to version 1.1
In-Reply-To: <1493785264-17179-1-git-send-email-xlcwu.taiwan@gmail.com>
References: <1493785264-17179-1-git-send-email-xlcwu.taiwan@gmail.com>
Message-ID: <20170729230253.2ad80ad8@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  3 May 2017 04:21:04 +0000, xlcwu wrote:
>     1. Cleanup the libcgi package, 
>        by using https://github.com/rafaelsteil/libcgi as an upstream.
>     2. Remove old patch and use cmake to build new version.
> 
> Signed-off-by: xlcwu <xlcwu.taiwan@gmail.com>
> 
> Changes v1 -> v2:
>   - Remove old patch
>   - Cleanup libcgi.mk
>   - Rewrite commit log and reformat it
> ---
>  package/libcgi/0001-misc-fixes.patch | 122 -----------------------------------
>  package/libcgi/libcgi.hash           |   2 +-
>  package/libcgi/libcgi.mk             |  12 ++--
>  3 files changed, 7 insertions(+), 129 deletions(-)
>  delete mode 100644 package/libcgi/0001-misc-fixes.patch

Sorry for the long delay. Your patch looks good, however I can't take
it for a very simple reason: patches need to be contributed with the
real name of submitters. Is it correct that xlcwu isn't your real name ?

Could you resubmit your patch using your real name ?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Aug 2015 19:29:22 +0200
Subject: [Buildroot] [PATCH 1/2] package/libtheora: Fix dynamic linking
In-Reply-To: <1438438841-31219-1-git-send-email-bernd.kuhls@t-online.de>
References: <1438438841-31219-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150802192922.46d6d4cb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat,  1 Aug 2015 16:20:40 +0200, Bernd Kuhls wrote:
> libtheoraenc.so needs to be linked to libtheoradec.so in order to avoid
> 
> symbol 'th_comment_query_count': can't resolve symbol in lib '/usr/lib/libtheoraenc.so.1'
> 
> when starting Freeswitch.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libtheora/0001-link-libtheoradec.patch | 21 ++++++++++++
>  package/libtheora/0002-fix-autoreconf.patch    | 46 ++++++++++++++++++++++++++
>  package/libtheora/libtheora.mk                 |  1 +
>  3 files changed, 68 insertions(+)
>  create mode 100644 package/libtheora/0001-link-libtheoradec.patch
>  create mode 100644 package/libtheora/0002-fix-autoreconf.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

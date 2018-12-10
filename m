From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 10 Dec 2018 13:29:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/weston: bump to version 5.0.0
In-Reply-To: <1544439986-16889-1-git-send-email-james.hilliard1@gmail.com>
References: <1544439986-16889-1-git-send-email-james.hilliard1@gmail.com>
Message-ID: <87k1kh7h74.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi James,

james.hilliard1 at gmail.com writes:
> From: James Hilliard <james.hilliard1@gmail.com>
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...tor-fix-compilation-against-FreeRDP-2.0.0.patch | 181 ---------------------
>  package/weston/weston.hash                         |  10 +-
>  package/weston/weston.mk                           |   2 +-
>  3 files changed, 6 insertions(+), 187 deletions(-)
>  delete mode 100644 package/weston/0002-rdp-compositor-fix-compilation-against-FreeRDP-2.0.0.patch

As you remove the configure.ac patch, is autoreconf still needed? If it
is, please update the autoreconf comment.

baruch

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

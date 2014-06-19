From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Thu, 19 Jun 2014 23:33:47 +0200
Subject: [Buildroot] [PATCH v2 0/3] Bump packages before adding libgtk3
In-Reply-To: <1403213235-16624-1-git-send-email-hadrien.boutteville@gmail.com>
References: <1403213235-16624-1-git-send-email-hadrien.boutteville@gmail.com>
Message-ID: <53A3573B.5070300@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

On Thu, 19 Jun 2014 23:27:12 +0200, Hadrien Boutteville wrote:
> Hello all,
> 
> I'm currently packaging libgtk3 (work in progress, patch soon), and
> this series bumps pango and libglib2 as it is necessary for libgtk3, and
> add Freetype support to Cairo.
> 
> This series is juste compiled-tested, so it's mostly an RFC. I will do
> running tests with libgtk3 and libgtk2.
> 
> Regards,
> 
> Hadrien
> 
> ---
> Changes v1 -> v2:
>   - add comments to patches inside Buildroot (Thomas De S.)
> ---
> 
> Hadrien Boutteville (3):
>   libglib2: bump to version 2.40.0
>   pango: bump to version 1.36.3
>   cairo: add freetype dependency for freetype support
> 
>  package/cairo/cairo.mk                             |   7 +
>  ...ror-format-string-errors-from-mismatched-.patch |  56 ---
>  package/libglib2/libglib2-0002-no-gtk-doc.patch    |  11 +
>  package/libglib2/libglib2.mk                       |   4 +-
>  package/pango/Config.in                            |   1 +
>  package/pango/pango-0001-no-tests.patch            |  21 +
>  package/pango/pango-0002-no-gtk-doc.patch          |  11 +
>  package/pango/pango-no-const-return.patch          | 475 ---------------------
>  package/pango/pango-no-tests.patch                 |  22 -
>  package/pango/pango.mk                             |  19 +-
>  10 files changed, 63 insertions(+), 564 deletions(-)
>  delete mode 100644 package/libglib2/0001-gio-Fix-Werror-format-string-errors-from-mismatched-.patch
>  create mode 100644 package/libglib2/libglib2-0002-no-gtk-doc.patch
>  create mode 100644 package/pango/pango-0001-no-tests.patch
>  create mode 100644 package/pango/pango-0002-no-gtk-doc.patch
>  delete mode 100644 package/pango/pango-no-const-return.patch
>  delete mode 100644 package/pango/pango-no-tests.patch
> 

Please ignore this series, I messed up with my commits' hashes..

Resending.

Sorry,

Hadrien

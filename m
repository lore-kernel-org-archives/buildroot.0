From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 18 Jun 2014 22:10:42 +0200
Subject: [Buildroot] [PATCH 2/3] pango: bump to version 1.36.3
In-Reply-To: <1403108345-12404-3-git-send-email-hadrien.boutteville@gmail.com>
References: <1403108345-12404-1-git-send-email-hadrien.boutteville@gmail.com>
 <1403108345-12404-3-git-send-email-hadrien.boutteville@gmail.com>
Message-ID: <c7e5aef7-da06-4e94-ae71-1ba1a89e5751@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hadrien Boutteville <hadrien.boutteville@gmail.com> schreef:
>Note: HarfBuzz is needed to build Pango. Configure does not return an
>error if HarfBuzz is missing, but without HarfBuzz it can't enable any
>backends.
>
>Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
>Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
>---
> package/pango/Config.in                   |   1 +
> package/pango/pango-0001-no-tests.patch   |  21 ++
> package/pango/pango-0002-no-gtk-doc.patch |  11 +
> package/pango/pango-no-const-return.patch | 475 ------------------------------
> package/pango/pango-no-tests.patch        |  22 --
> package/pango/pango.mk                    |  19 +-
> 6 files changed, 43 insertions(+), 506 deletions(-)
> create mode 100644 package/pango/pango-0001-no-tests.patch
> create mode 100644 package/pango/pango-0002-no-gtk-doc.patch
> delete mode 100644 package/pango/pango-no-const-return.patch
> delete mode 100644 package/pango/pango-no-tests.patch


Same comment about header in newly added patches...

Best regards,
Thomas

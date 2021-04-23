From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Fri, 23 Apr 2021 11:01:18 +0300
Subject: [Buildroot] [PATCH 1/1] package/postgis: add optional
 protobuf-c dependency
In-Reply-To: <20210422182641.654969-1-fontaine.fabrice@gmail.com>
References: <20210422182641.654969-1-fontaine.fabrice@gmail.com>
Message-ID: <1ea52ed9-bf28-4c81-1555-02e6f65a3950@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

22.04.2021 21:26, Fabrice Fontaine wrote:
> Signed-off-by: Fabrice Fontaine<fontaine.fabrice@gmail.com>
> ---
>   ...ix-cross-compilation-with-protobuf-c.patch | 42 +++++++++++++++++++
>   package/postgis/postgis.mk                    | 10 ++++-
>   2 files changed, 50 insertions(+), 2 deletions(-)
>   create mode 100644 package/postgis/0005-configure.ac-fix-cross-compilation-with-protobuf-c.patch

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>

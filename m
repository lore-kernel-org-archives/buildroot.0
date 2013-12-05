From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 5 Dec 2013 13:46:27 +0100
Subject: [Buildroot] [PATCH] pkg-config: remove deprecated
In-Reply-To: <1386245156-21088-1-git-send-email-gustavo@zacarias.com.ar>
References: <1386245156-21088-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <CAAXf6LX5XR8fh7hWUfxO2GOLdyykhLM4Ym9tq2PgwRUEmRK3CQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Thu, Dec 5, 2013 at 1:05 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in                                  |  1 -
>  package/pkg-config/Config.in                       | 19 --------------
>  .../pkg-config/pkg-config-0.25-fix-variable.patch  | 30 ----------------------
>  package/pkg-config/pkg-config.mk                   | 12 ---------
>  4 files changed, 62 deletions(-)
>  delete mode 100644 package/pkg-config/Config.in
>  delete mode 100644 package/pkg-config/pkg-config-0.25-fix-variable.patch
>  delete mode 100644 package/pkg-config/pkg-config.mk

File package/pkgconf/pkgconf.mk still contains a reference to
BR2_PACKAGE_PKG_CONFIG that should be removed now...

Best regards,
Thomas

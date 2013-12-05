From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 5 Dec 2013 14:06:09 +0100
Subject: [Buildroot] [PATCHv2] pkg-config: remove deprecated
In-Reply-To: <1386247960-10328-1-git-send-email-gustavo@zacarias.com.ar>
References: <1386247960-10328-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <CAAXf6LWCbDGc9Wo6QTMpjHAbgSNTYRxxLT+d1w1Bb4ku-HJ2ew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Thu, Dec 5, 2013 at 1:52 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in                                  |  1 -
>  package/pkg-config/Config.in                       | 19 --------------
>  .../pkg-config/pkg-config-0.25-fix-variable.patch  | 30 ----------------------
>  package/pkg-config/pkg-config.mk                   | 12 ---------
>  package/pkgconf/pkgconf.mk                         |  2 --
>  5 files changed, 64 deletions(-)
>  delete mode 100644 package/pkg-config/Config.in
>  delete mode 100644 package/pkg-config/pkg-config-0.25-fix-variable.patch
>  delete mode 100644 package/pkg-config/pkg-config.mk

Sorry that I didn't notice this the first time, but Makefile.legacy
also still has a reference to host-pkg-config that needs to be
removed.

Best regards,
Thomas

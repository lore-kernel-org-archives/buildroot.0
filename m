From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 30 Nov 2011 16:54:07 +0100
Subject: [Buildroot] [PATCH 1/2] iw: fix build with new libnl-3
In-Reply-To: <1322665560-29888-1-git-send-email-zonque@gmail.com>
References: <CAGm1_kt-QPDOyfnnjQJ=R_8=S_++h0GcDY4wid7J69v2QawExw@mail.gmail.com>
 <1322665560-29888-1-git-send-email-zonque@gmail.com>
Message-ID: <CAGm1_kvpf=bZxzPqgXQ65R_vo6XVp-3KFkjCt_JC8WY32OPaiw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 30, 2011 at 4:05 PM, Daniel Mack <zonque@gmail.com> wrote:
> The CFLAGS have to be augmented for the include dir and the patch
> needs to be tweaked to make the binary link to libnl-3 instead of
> libnl-gen.
>
> Signed-off-by: Daniel Mack <zonque@gmail.com>
> ---
> ?package/iw/iw-libnl-30-support.patch | ? ?2 +-
> ?package/iw/iw.mk ? ? ? ? ? ? ? ? ? ? | ? ?2 +-
> ?2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/iw/iw-libnl-30-support.patch b/package/iw/iw-libnl-30-support.patch

this file has gone in next. Please rebase your patches on the next
branch and try to get iw from git with this commit
http://git.sipsolutions.net/?p=iw.git;a=commit;h=a82abc2cac9dea7def53070565201145c76c8c6c.

Yegor

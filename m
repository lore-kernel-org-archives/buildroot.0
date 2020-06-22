From: Joel Carlson <JoelsonCarl@gmail.com>
Date: Mon, 22 Jun 2020 12:52:15 -0600
Subject: [Buildroot] [PATCH v2] package/capnproto: bump version to 0.8.0
In-Reply-To: <20200516075313.GB31946@coltrane>
References: <20200516075313.GB31946@coltrane>
Message-ID: <CA+1k=2boCuj=uaffJo7Ug26y+so7TtMEcVkeCXXoWAFOnYtxng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, May 16, 2020 at 1:53 AM Koen Martens <gmc@sonologic.nl> wrote:
>
> The new version requires an extra features in the
> toolchain and won't build with a specific gcc
> bug, therefore two new toolchain options are added
> as dependencies:
>
> * !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> * BR2_TOOLCHAIN_HAS_UCONTEXT
>
> Signed-off-by: Koen Martens <gmc@sonologic.nl>
>
> ---
> changes v1 -> v2:
>   - use !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 instead of
>     BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
>     (suggested by Thomas Petazzoni)
> ---

<snip>
Applied patch to master, tested by running all toolchains with test-pkg:
44 builds, 17 skipped, 0 build failed, 0 legal-info failed

Reviewed-by: Joel Carlson <JoelsonCarl@gmail.com>
Tested-by: Joel Carlson <JoelsonCarl@gmail.com>

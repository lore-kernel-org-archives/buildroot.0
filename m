From: Jeroen Roovers <jer@airfi.aero>
Date: Wed, 26 Oct 2016 16:21:14 +0200
Subject: [Buildroot] [git commit] tcpdump: bump version to 4.8.1
In-Reply-To: <20161026103026.ED15581E81@busybox.osuosl.org>
References: <20161026103026.ED15581E81@busybox.osuosl.org>
Message-ID: <CANCHnQp-rgEdvxh82WT=W51XGneryQJ=rx=qr+mRVBSmXFmCRQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libpcap releases follow tcpdump releases very closely, but libpcap in
buildroot is still at 1.7.4 while 1.8.1 came out along with tcpdump
4.8.1 (and 1.8.0 accompanied 4.8.0).


Kind regards,
     jer

On 26 October 2016 at 12:29, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=4f4657985d0643017d037fd50eaf8cef439d6c9b
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/tcpdump/tcpdump.hash | 2 +-
>  package/tcpdump/tcpdump.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/tcpdump/tcpdump.hash b/package/tcpdump/tcpdump.hash
> index 997cd42..21fb83f 100644
> --- a/package/tcpdump/tcpdump.hash
> +++ b/package/tcpdump/tcpdump.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated after checking pgp signature
> -sha256 177385d9d17d1d99ba6aa3ea63a8400a5f4c54db62b83ac6d4da56944bee623b  tcpdump-4.8.0.tar.gz
> +sha256 20e4341ec48fcf72abcae312ea913e6ba6b958617b2f3fb496d51f0ae88d831c  tcpdump-4.8.1.tar.gz
> diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
> index 559b816..3773fcb 100644
> --- a/package/tcpdump/tcpdump.mk
> +++ b/package/tcpdump/tcpdump.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -TCPDUMP_VERSION = 4.8.0
> +TCPDUMP_VERSION = 4.8.1
>  TCPDUMP_SITE = http://www.tcpdump.org/release
>  TCPDUMP_LICENSE = BSD-3c
>  TCPDUMP_LICENSE_FILES = LICENSE
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

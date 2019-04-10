From: Markus Mayer <mmayer@broadcom.com>
Date: Wed, 10 Apr 2019 15:04:51 -0700
Subject: [Buildroot] [PATCH v2] package/coreutils: allow building
 individual binaries
In-Reply-To: <87r2a9r2p6.fsf@dell.be.48ers.dk>
References: <20190410201746.14678-1-mmayer@broadcom.com>
 <87r2a9r2p6.fsf@dell.be.48ers.dk>
Message-ID: <CAGt4E5tT2P-Tj7-pxcjRq-dgnz5FHPrtw6_jaQwSTgv_FMnC3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 10 Apr 2019 at 14:05, Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Markus" == Markus Mayer <mmayer@broadcom.com> writes:
>
>  > We add configuration option BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES
>  > so that coreutils can be built and installed as individual binaries.
>  > It can be used if the target file system doesn't support symlinks or
>  > symlinks are undesirable.
>
> Out of interest, what file system is that?

VFAT -- yeah I know. At least only as a possible install medium not as
the rootfs.

>  > The approach is modelled after Busybox's similarly named configuration
>  > option.
>
> The use case for individual binaries for busybox is afaik mainly for
> stuff like selinux, where you may want to have different policies for
> the different applets.

That would certainly be another use case, which could also be listed
in the commit message.

Regards,
-Markus

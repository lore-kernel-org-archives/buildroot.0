From: Simon Dawson <spdawson@gmail.com>
Date: Fri, 9 Nov 2012 13:36:09 +0000
Subject: [Buildroot] [PATCH 1/2] neard: new package
In-Reply-To: <20121109142044.09933dfa@skate>
References: <1352459105-13590-1-git-send-email-spdawson@gmail.com>
 <1352459105-13590-2-git-send-email-spdawson@gmail.com>
 <20121109142044.09933dfa@skate>
Message-ID: <CAHt8ZCPYfzMjsRuhAn_CdYtqUVp7+=Sw4Eq+vLRjS1sR=RiS1g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas; thanks for the feedback.

On 9 November 2012 13:20, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> > +     depends on BR2_LINUX_KERNEL
>
> Why this dependency?

You're right; this is superfluous.

> > +     help
> > +       Near Field Communication (NFC) manager
>
> A slightly longer description would be useful here.

Okay.

> > +       https://01.org/linux-nfc/documentation/how-start-linux-nfc-code...
>
> Those "..." at the end look strange.

Yes, they do look strange; but this is correct --- the dots are a
required part of the URL.

> > +NEARD_AUTORECONF = YES
>
> The package does not have any patches, and is downloaded from a
> tarball. Why is an autoreconf needed?

The autoreconf is not needed; thanks for pointing this out.

I'll rework the patch.

Simon.

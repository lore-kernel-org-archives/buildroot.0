From: abhimanyu.v at gmail.com <abhimanyu.v@gmail.com>
Date: Mon, 17 Apr 2017 23:41:27 +0530
Subject: [Buildroot] [PATCH v8 1/2] genimage.sh: fix calling from
	BR2_ROOTFS_POST_IMAGE_SCRIPT
In-Reply-To: <20170417142020.3gx4zqnvlv7cbmiv@gportay>
References: <20170416174048.4737-1-abhimanyu.v@gmail.com>
 <20170416212937.64yzqpdbbivp3qep@gportay>
 <CA+V_ovuOD_kqkdvrLaKwkVVTCS9NN+8m7SOpRmT-8vg30O_eQQ@mail.gmail.com>
 <20170417142020.3gx4zqnvlv7cbmiv@gportay>
Message-ID: <CA+V_ovsHj4hiXg2pUZ=ZrsqX9Q_NpkACWroS+L5kx=0LtbJzyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ga?l,

On Mon, Apr 17, 2017 at 7:50 PM, Ga?l PORTAY <
gael.portay@savoirfairelinux.com> wrote:

> Hello Abhimanyu,
>
> On Mon, Apr 17, 2017 at 03:38:27PM +0530, abhimanyu.v at gmail.com wrote:
> > Thankyou Ga?l for review!
> >
>

<snip>


> Afterward, my suggestion about shift does not suit me.
>
> If genimage.sh is run inside a post-image script, this same script have to
> give
> a fake parameter as first argument.
>
>         #!/bin/sh
>         #
>         # BR post-image script
>         #
>         # (...)
>
>         support/scripts/genimage.sh "$1" -c path/to/genimage.cfg
>
>
The proposed changes to script doesn't have above issue.

<snip>

Regards
Abhimanyu V
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170417/67dec21f/attachment.html>

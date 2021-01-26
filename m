From: Matthew Weber <matthew.weber@collins.com>
Date: Tue, 26 Jan 2021 07:09:23 -0600
Subject: [Buildroot] [External] Re: [PATCH 2/2] package/uboot-tools:
 env/script generation need BINARIES_DIR
In-Reply-To: <20210125232241.6f903f96@windsurf.home>
References: <20210125145742.42460-1-matthew.weber@rockwellcollins.com>
 <20210125145742.42460-2-matthew.weber@rockwellcollins.com>
 <20210125221651.10112779@windsurf.home>
 <CANQCQpZvXB_w=VjTrPM45CYcCtxmvCZB7thxB8v=E6yNaWdw2A@mail.gmail.com>
 <20210125214255.GS2325@scaer> <20210125232241.6f903f96@windsurf.home>
Message-ID: <CANQCQpa6f459ijuc+JihT43x_ZMeo1dG6OmA-UwOXMGbFM4mWw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Mon, Jan 25, 2021 at 4:23 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Mon, 25 Jan 2021 22:42:55 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
>
> > On principle, I do agree with Thomas.
> >
> > However, I would point out that this is way wider than just the script
> > image. Indeed, we also have HOST_UBOOT_TOOLS_GENERATE_ENV_IMAGE which
> > is only called at install time.
>
> Well, the patch is also adding a mkdir inside the code generating the
> environment image.

v2 will be out in a bit, i'll mark this one as superseded.

Regards,
Matt

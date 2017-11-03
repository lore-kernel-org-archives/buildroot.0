From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 3 Nov 2017 07:59:08 -0500
Subject: [Buildroot] [PATCH v2] uboot-tools: bump to version 2017.09
In-Reply-To: <20171103135056.47701a6c@windsurf>
References: <1509562398-20833-1-git-send-email-fabio.estevam@nxp.com>
 <20171103135056.47701a6c@windsurf>
Message-ID: <CANQCQpap8Cs6SMX6bq=aYqjEup9hF7QnXbaum5a4LMjXFbBOkg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Fabio

On Fri, Nov 3, 2017 at 7:50 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> Hello,
>
> On Wed, 1 Nov 2017 16:53:18 -0200, Fabio Estevam wrote:
> > The 'env' target has been renamed to 'envtools' so change it
> > accordingly.
> >
> > Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> > ---
> > Changes since v1:
> > - Take the 'env' target rename into account
>
> I'm not sure if it's this version bump, or Matthew Weber's patch about
> pylibfdt, but we're seeing new build failures with host-uboot-tools:
>
>   http://autobuild.buildroot.net/?reason=host-uboot-tools-2017.09
>
> Could one of you have a look?
>

Sure

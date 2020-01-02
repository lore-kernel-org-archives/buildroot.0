From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 2 Jan 2020 09:16:44 -0600
Subject: [Buildroot] [PATCH 1/2] package/libopenssl: move options
In-Reply-To: <20191230233308.2737aaa6@windsurf>
References: <cover.1577738159.git.yann.morin.1998@free.fr>
 <3b8aa710fabea4b4c22d4bc2c0944bdc976c7d18.1577738159.git.yann.morin.1998@free.fr>
 <20191230233308.2737aaa6@windsurf>
Message-ID: <CANQCQpYjtvGszm6NRx3mczPXJZPAdT2g6XVg17XQLBtSH1aYAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,


On Mon, Dec 30, 2019 at 4:33 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Mon, 30 Dec 2019 21:36:14 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
>
> > Since e3159cad71 (package/libopenssl: move target arch selection
> > to Config.in), we have a Config.in that contains a few options to
> > configure libopenssl (openSSL, the original).
> >
> > As such, it makes sense to move the remaining options there too.
> >
> > We also move the condition there, mimicking what is done for the
> > external toolchains' options too.
> >
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: Matt Weber <matthew.weber@rockwellcollins.com>
>

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>

From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 13 Mar 2017 10:43:34 +0100
Subject: [Buildroot] [PATCH] kmscube: Move to the new repository
In-Reply-To: <CAOMZO5CLtfsQHXT3QMy6bA1-=eSMg-uCHjuxRNYL8VrxB5v2qQ@mail.gmail.com>
References: <1488803273-25019-1-git-send-email-festevam@gmail.com>
 <20170306212225.0819a97b@free-electrons.com>
 <CAOMZO5Bpy6sBTTX1sHitL8mRsNDNF1_PWsvqRTrvfzhd2xG45A@mail.gmail.com>
 <20170306213121.203079d8@free-electrons.com>
 <CAAMH-yuhrg_CxW2YjdjBqrKExiHp57fsDyK_dWD3RXP0hhRWmA@mail.gmail.com>
 <CAOMZO5AGOE8tnKEokxRBww92xoARZLHnrtbaQD1udZGORUfKuQ@mail.gmail.com>
 <CAAMH-yuY=34_k46VPjhDVjLZCaopPsqDe8tRQ5MfqFeW5i+HQQ@mail.gmail.com>
 <CAOMZO5DS7SBwS+Arvb-7a=6B3=4Jo75QAdNh6toAwFsgzvUwdw@mail.gmail.com>
 <CAAMH-ys1J+wuKrEQ7dN=YbcbgTB+kjK0SJJV4Cvj2X9G0yf1pQ@mail.gmail.com>
 <CAOMZO5BxKvub7SRbiwdDFc0W6Kxr=V8nj7uA=WYUc_iAGAQpNw@mail.gmail.com>
 <CAAMH-ythsVpak9K2JqXG5qR3gXNOgWQ60vXxMwvRKPksbrVOnQ@mail.gmail.com>
 <878toeaz13.fsf@dell.be.48ers.dk>
 <CAAMH-yvbmyvqbRckOBm7UuMM8eNH2k6TQGS0mH0O4_B-iDBOnA@mail.gmail.com>
 <CAOMZO5CLtfsQHXT3QMy6bA1-=eSMg-uCHjuxRNYL8VrxB5v2qQ@mail.gmail.com>
Message-ID: <CAAMH-ytNr+uhPaAthAPVykKc7njWH7d7PHHifeaAqKf1Bf8rOA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

On Fri, Mar 10, 2017 at 4:45 PM, Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Gary,
>
> On Fri, Mar 10, 2017 at 6:47 AM, Gary Bisson
> <gary.bisson@boundarydevices.com> wrote:
>
> > Adding a dependency on headers >= 4.7 would definitely work and I
> > think it's the easiest/cleanest option here.
> >
> > I'll just be sad not to be able to use the prebuilt (linaro) toolchain ;)
>
> What about sending the #include <libdrm/drm_mode.h> fix upstream?

I just sent the patch upstream, we'll see how it goes.

Regards,
Gary

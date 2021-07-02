From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 2 Jul 2021 08:25:27 -0700
Subject: [Buildroot] [PATCH 0/5] nginx updates
In-Reply-To: <20210630211615.GB2829@scaer>
References: <20210628161610.3197763-1-aduskett@gmail.com>
 <a44b24ab6d4af719790f5b6e03821a64ed93f23f.camel@calian.com>
 <20210630211615.GB2829@scaer>
Message-ID: <CAFSsvmo8dz9EVkLBaoKPr2Z=DnDZk3zSC_FdOe4p3E60NYwuCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After the v2 patch series is approved (or marked as Changed requested)
I can also update nginx-upload.

Adam

On Wed, Jun 30, 2021 at 2:16 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Robert, All,
>
> On 2021-06-28 18:02 +0000, Robert Hancock via buildroot spake thusly:
> > On Mon, 2021-06-28 at 09:16 -0700, Adam Duskett wrote:
> > > Just some nginx maintnence.
> [--SNIP--]
> > > The nginx-upload package also has updates, however, the current nginx-upload
> > > url
> > > points to a fork of nginx-upload-module. The official project URL is fdintino
> > > not vkholodkov. Should this be changed to fdintino and the version changed to
> > > 4423994c7d8fb491d95867f6af968585d949e7a9?
> >
> > I believe at one point the fdintino repository was quite behind and was missing
> > a bunch of features like HTTP/2 support that were in the vkholodkov fork. It
> > looks like the vkholodkov version is only 1 commit ahead of fdintino right now
> > however, so we might be able to switch to the "official" version.
>
> Thanks for the explanations. :-)
>
> Would you be willing to send a patch doing the switch, then?
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

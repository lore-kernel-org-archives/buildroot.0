From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 26 Dec 2018 19:35:04 +0100
Subject: [Buildroot] [PATCH v2 2/2] boot/systemd-boot: new package
In-Reply-To: <20181226145941.7db5c114@windsurf.home>
References: <1545782200-1312-1-git-send-email-james.hilliard1@gmail.com>
 <1545782200-1312-2-git-send-email-james.hilliard1@gmail.com>
 <20181226085129.GC14286@scaer>
 <CADvTj4rFtysDBbBe0RvJb6HS-Gwxr=bWyrhWoA2PJ8pdhw2FtA@mail.gmail.com>
 <20181226121856.GG14286@scaer>
 <20181226145941.7db5c114@windsurf.home>
Message-ID: <20181226183504.GH14286@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-12-26 14:59 +0100, Thomas Petazzoni spake thusly:
> On Wed, 26 Dec 2018 13:18:56 +0100, Yann E. MORIN wrote:
> > On 2018-12-26 05:33 -0600, James Hilliard spake thusly:
> > > On Wed, Dec 26, 2018 at 2:51 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:  
> > > > On 2018-12-26 07:56 +0800, james.hilliard1 at gmail.com spake thusly:  
> > > > >   - remove more dependencies checks  
> > > > Why? That was absolutely not necessary.  
> > > Hmm, maybe my test setup is different than yours, it seemed to be
> > > neccesary to get a succesful compile. My setup where I was getting a
> > > failure was default everything other than adding the systemd-boot
> > > package .  
> > Hm.. I only tested four setups:
> >   - x86_64, systemd with systemd-boot, external toolchain,
> >   - x86_64, systemd-boot standalone, external toolchain,
> >   - i686, systemd with systemd-boot, external toolchain,
> >   - i686, systemd-boot standalone, external toolchain.
> Did you collect these as tests for support/testing/ ? :-)

Of course I did collect them. They are right there, on neuron #4,435,836,719.
It's safely stored there for a future gc. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 Dec 2018 14:40:23 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/mesa3d: bump to version
 18.3.1
In-Reply-To: <CADvTj4qFBuK8QaRf_PJ34WsSVSVJNMLV8sq-QqUC2vte2OJrqQ@mail.gmail.com>
References: <1544861438-11607-1-git-send-email-james.hilliard1@gmail.com>
 <20181215103930.GC2625@scaer>
 <CADvTj4pXxGg4uTWi2xevajAiUiv95V15uMDopsWd4j=4tnhZcQ@mail.gmail.com>
 <20181215110439.GF2625@scaer>
 <CADvTj4qFBuK8QaRf_PJ34WsSVSVJNMLV8sq-QqUC2vte2OJrqQ@mail.gmail.com>
Message-ID: <20181215134023.GG2625@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2018-12-15 04:15 -0700, James Hilliard spake thusly:
> On Sat, Dec 15, 2018 at 4:04 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2018-12-15 03:56 -0700, James Hilliard spake thusly:
> > > Wouldn't it make
> > > sense to have mesa3d and mesa3d-headers share the same package version
> > > so that only one needs to be bumped?
> > That's unfortunately not possible, see the comment in mesa3d-headers...
> I think you could turn mesa3d-headers into a virtual/fake package
> similar to how I did it with my systemd-boot patch. Then you wouldn't
> have to refer to variables in mesa3d.

No, because that would make mesa3d more complex, for little benefit, see
the commit log of 8138a36018 (package/mesa3d-headers: new package), in
which there is an blurb about that.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 2 Nov 2018 15:29:39 -0500
Subject: [Buildroot] [PATCH 1/3] fs: apply permissions late
In-Reply-To: <20181031214939.GO28575@scaer>
References: <cover.1540626349.git.yann.morin.1998@free.fr>
 <4f9a31b0fb8f87ded9c788cb92d727b6763859ac.1540626349.git.yann.morin.1998@free.fr>
 <CANQCQpa3y_Qs7H9aB1Y7fpW9G=V2Dr2yqM9WihrQBuqUbPoEhA@mail.gmail.com>
 <20181030202331.GI28575@scaer>
 <CANQCQpZEKo9oFpVh5SPb-8NYzq88hH0sg4LzFwVqk7Zz6AQTuA@mail.gmail.com>
 <20181031214939.GO28575@scaer>
Message-ID: <CANQCQpZAR0xh9MkHWFcV+6_k9oD2bXXTVaCyC83_Yt6xu8cYgw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,


On Wed, Oct 31, 2018 at 4:49 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Matt, All,
>
> On 2018-10-30 20:18 -0500, Matthew Weber spake thusly:
> > On Tue, Oct 30, 2018 at 3:23 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > >     Since kernel 2.6.24, the kernel supports associating capability sets
> > >     [...] stored in an extended attribute (see setxattr(2)) named
> > >     security.capability.o
> > :-) Fair,  security.capabilty -> security.capability
>

Tested-by: Matthew Weber <matthew.weber@rockwellcollins.com>

Ran some scenaios as a regression on existing target builds before and
after the change.

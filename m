From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Aug 2013 22:14:53 +0200
Subject: [Buildroot] List of pending patches: what to do?
In-Reply-To: <20130801081303.4d1570aa@skate>
References: <20130731191415.545f7dff@skate>
 <CANxTyt5V08njumRpKWQJEqThgd_FUKYnjg+XLwbFbWk+MKvx6Q@mail.gmail.com>
 <20130801081303.4d1570aa@skate>
Message-ID: <20130801201452.GA3406@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Danomi, All,

On 2013-08-01 08:13 +0200, Thomas Petazzoni spake thusly:
> On Wed, 31 Jul 2013 22:52:34 -0400, Danomi Manchego wrote:
> > > http://patchwork.ozlabs.org/patch/249912 Makefile: change rsync used in
> > > overlays to always transfer files
> > 
> > The patch still applies, with no fuzz but some shifted lines.  The problem
> > described still exists, and is still fixed by the patch.
> 
> It looks good, but I'd like to have someone ACK or test the patch.
> Yann, Gustavo, Arnout?

I've looked at it, and it indeed seems to be a needed and beneficial
change. I can't think of unexpected adverse side-effect, so I'd
recommend we get it in, but probably in -next just to be extra safe.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

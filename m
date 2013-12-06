From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 6 Dec 2013 17:37:27 +0100
Subject: [Buildroot] [PATCH 1/3] package/lvm2: remove uninstall commands
In-Reply-To: <20131206103817.3388512a@skate>
References: <cover.1386023329.git.yann.morin.1998@free.fr>
 <87b70aafdc14794df97eaa937c841609d9b45ab4.1386023329.git.yann.morin.1998@free.fr>
 <20131206103817.3388512a@skate>
Message-ID: <20131206163727.GA3364@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-12-06 10:38 +0100, Thomas Petazzoni spake thusly:
> On Mon,  2 Dec 2013 23:29:55 +0100, Yann E. MORIN wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > We do not properly support uninstalling packages, so just remove
> > the uninstall commands.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  package/lvm2/lvm2.mk | 10 ----------
> >  1 file changed, 10 deletions(-)
> 
> I've marked this patch as superseded in patchwork, since all uninstall
> commands have been deleted by Thomas DS patch, including the lvm2 one.

Yes, thank you! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

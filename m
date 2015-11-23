From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 18:55:57 +0100
Subject: [Buildroot] [PATCH 1/3] core/pkg-autotools: align host
 configure commands to target one
In-Reply-To: <20151123175112.GF3857@free.fr>
References: <cover.1448202976.git.yann.morin.1998@free.fr>
 <f288b50c4267ceb0ca24aa1a7937d8f5fa894ed5.1448202976.git.yann.morin.1998@free.fr>
 <20151123183829.077c602c@free-electrons.com>
 <20151123175112.GF3857@free.fr>
Message-ID: <20151123175557.GG3857@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-11-23 18:51 +0100, Yann E. MORIN spake thusly:
> On 2015-11-23 18:38 +0100, Thomas Petazzoni spake thusly:
> > On Sun, 22 Nov 2015 15:39:41 +0100, Yann E. MORIN wrote:
> > > The host configure commands are not indented the same way as the target
> > > ones. Besides, there are leading spaces (instead of TABs) on one line.
> > > 
> > > Replicate the same indentation as used for the target commands.
> > > 
> > > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > > ---
> > >  package/pkg-autotools.mk | 12 ++++++------
> > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > Applied to next, thanks.
> 
> In the cover-letter, I suggestd this be applied to master.

No, I did not. It was just the name of the branch. Sigh...

Sorry for the noise...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

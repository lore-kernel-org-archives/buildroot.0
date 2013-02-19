From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 19 Feb 2013 20:01:57 +0100
Subject: [Buildroot] [PATCH 2/4] fs/ext2: add ability to build ext3/4 too
In-Reply-To: <201302191833.23535.yann.morin.1998@free.fr>
References: <cover.1361142401.git.yann.morin.1998@free.fr>
 <512323E4.7000901@mind.be> <201302191833.23535.yann.morin.1998@free.fr>
Message-ID: <201302192001.57065.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Tuesday 19 February 2013 Yann E. MORIN wrote:
> On Tuesday 19 February 2013 Arnout Vandecappelle wrote:
[--SNIP--]
> > > +# Remove -{2,3,4} from the arguments, they are not recognised
> > > +# by genext2fs and we handle them manually later
> > 
> >   Wouldn't it be a lot simpler to pass the generation through the 
> > environment instead?
> 
> I'd like to avoid 'scanning' .config if possible.
> But I'll see what to do about it.

Forget it, I've seen The Light! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

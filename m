From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 12 Mar 2013 23:56:58 +0100
Subject: [Buildroot] [PATCH 2/6] fs/ext2: add ability to build ext3/4 too
In-Reply-To: <513F6892.7070409@mind.be>
References: <cover.1362693453.git.yann.morin.1998@free.fr>
 <20130310145851.4f1f6539@skate> <513F6892.7070409@mind.be>
Message-ID: <201303122356.58938.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Thomas, All,

On Tuesday 12 March 2013 Arnout Vandecappelle wrote:
> On 03/10/13 14:58, Thomas Petazzoni wrote:
> > Maybe we could set the volume name to 'buildroot' ? I.e:
> >
> > 	tune2fs -L buildroot "${IMG}"
> 
>   I don't particularly like that. If you're going to add volume names, it 
> should be configurable.

It can even be a generic FS option, that can be used by all FS that can
set a label.

Material for a separate series, though; will do later.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

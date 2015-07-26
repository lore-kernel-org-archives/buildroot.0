From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Jul 2015 22:02:33 +0200
Subject: [Buildroot] [PATCHv2 1/1] xterm: x-includes and x-libraries
 must be set for cross-compiling
In-Reply-To: <20150726214445.4b5534a1@free-electrons.com>
References: <1437932796-16216-1-git-send-email-bas@bmail.ru>
 <20150726175949.GI3770@free.fr>
 <20150726214445.4b5534a1@free-electrons.com>
Message-ID: <20150726200233.GJ3770@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-07-26 21:44 +0200, Thomas Petazzoni spake thusly:
> On Sun, 26 Jul 2015 19:59:49 +0200, Yann E. MORIN wrote:
> > On 2015-07-26 20:46 +0300, kyak spake thusly:
> > > From: Mikhail Peselnik <bas@bmail.ru>
> > The From filed does not match your Signed-off-by; please fix your git
> > config with:
> > 
> >     git config --global user.name 'Mikhail Peselnik'
> >     git config --global user.email 'bas at bmail.ru'
> 
> Are you sure?
> 
> In the patch itself, I see:
> 
>   From: Mikhail Peselnik <bas@bmail.ru>
>   Signed-off-by: Mikhail Peselnik <bas@bmail.ru>

Ah, right. Then it would be:

    git conmfig --global sendemail.from 'Mikhail Peselnik <bas@bmail.ru>'

> which does match. However, it indeed doesn't match the From of the mail
> itself:
> 
>   From: kyak <bas@bmail.ru>
> 
> Which I'm not sure is related to the Git configuration. And while it's
> a bit ugly, I think it doesn't cause any problem because Git will use
> the From: from inside the patch itself in preference over the From: of
> the e-mail.

Indeed, forget what I said. I was just a bit surprised that the From
field in the mail headers did not match the SoB line; but since there's
a From field in the patch itself, all is good wrt. git keeping
authorship.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

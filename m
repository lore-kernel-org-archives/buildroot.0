From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 21:44:45 +0200
Subject: [Buildroot] [PATCHv2 1/1] xterm: x-includes and x-libraries
 must be set for cross-compiling
In-Reply-To: <20150726175949.GI3770@free.fr>
References: <1437932796-16216-1-git-send-email-bas@bmail.ru>
 <20150726175949.GI3770@free.fr>
Message-ID: <20150726214445.4b5534a1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sun, 26 Jul 2015 19:59:49 +0200, Yann E. MORIN wrote:

> On 2015-07-26 20:46 +0300, kyak spake thusly:
> > From: Mikhail Peselnik <bas@bmail.ru>
> > 
> > These flags need to be set so that the configure script would
> > correctly use libICE from cross-toolchain rather than from host.
> > Also, the xterm package is missing the freetype2 dependency, as
> > noted by Romain Naour.
> > 
> > This fix is similar to "package/efl/libevas: x-includes and x-libraries
> > must be set for cross-compiling" done by Romain Naour on libecore.
> > 
> > Signed-off-by: Mikhail Peselnik <bas@bmail.ru>
> 
> The From filed does not match your Signed-off-by; please fix your git
> config with:
> 
>     git config --global user.name 'Mikhail Peselnik'
>     git config --global user.email 'bas at bmail.ru'

Are you sure?

In the patch itself, I see:

  From: Mikhail Peselnik <bas@bmail.ru>
  Signed-off-by: Mikhail Peselnik <bas@bmail.ru>

which does match. However, it indeed doesn't match the From of the mail
itself:

  From: kyak <bas@bmail.ru>

Which I'm not sure is related to the Git configuration. And while it's
a bit ugly, I think it doesn't cause any problem because Git will use
the From: from inside the patch itself in preference over the From: of
the e-mail.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

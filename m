From: MERCADIER Johann <johann.mercadier@imerir.com>
Date: Wed, 21 Mar 2012 11:06:07 +0000
Subject: [Buildroot] [PATCH 1/1] Add FbTerm package for OMAP4
 (targetting pandaboard) Signed-off-by: JoM <johann.mercadier@imerir.com>
In-Reply-To: <20120321001637.6ac06f89@skate>
References: <1332281066-364-1-git-send-email-johann.mercadier@imerir.com>
 <20120321000525.0e834330@skate> <201203210013.28991.arnout@mind.be>
 <20120321001637.6ac06f89@skate>
Message-ID: <CAPEB33zX2XuoTbJRnUoQBhn+Fr+MNP8S81KJWvWLj7mHA1cKsA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas & Arnout,

   and thanks a lot for your feedback!

   So you are right I probably done something wrong with git as when I
change from my local branch 'patch_FBTERM' to 'master' the Config.in in the
package directory only inhold fbterm contents?!  But the patch I sent was a
package/Config.in which hold all the packages so there is something that I
still don't understand.

  Thomas : In all case I will modify each of your suggestions. So as to be
totally compliant with the new way of writing .mk files.

  Arnout : Ok for the staging part, I understand clearly why it is not
needed. normally libz and libexpat are used by fbterm but the only lib
really needed when I port fbterm was the both I kept in the .mk file. Do
you think I need to write them also as the fact I didn't need them was part
of my own config for which they were already installed?

  About the help section, Thomas is right I made a copy/paste, but from
different sites so as to give users a good understanding of what they are
going to install, without the need to go searching around... Maybe  it's
not necessary as most on the informations are on the main website (
http://code.google.com/p/fbterm/)?... Just let me know and I will correct
this for good of all.

Try to make it today.

Regards

-- 
Cordialement.

___Johann MERCADIER___

:(){ :|:& };:
"I am the Unknown lead by the Unknowing.
I have done so much with so little for so long
that I am now qualified to do anything with nothing."
HOOSEEK (http://www.hooseek.com/) 1?moteur de recherche solidaire!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120321/25d7b538/attachment.html>

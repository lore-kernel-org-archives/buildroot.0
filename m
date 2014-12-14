From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Dec 2014 19:16:31 +0100
Subject: [Buildroot] [PATCH] package/faad2: add hash
In-Reply-To: <XnsA403BE33C127EberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1418578396-11893-1-git-send-email-yann.morin.1998@free.fr>
 <XnsA403BE33C127EberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20141214181631.GC4121@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-12-14 18:41 +0100, Bernd Kuhls spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
> news:1418578396-11893-1-git-send-email-yann.morin.1998 at free.fr:
> 
> > +++ b/package/faad2/faad2.hash
> > @@ -0,0 +1,2 @@
> > +# Locally computed
> > +sha256  ee26ed1e177c0cd8fa8458a481b14a0b24ca0b51468c8b4c8b676fd3ceccd330  faad2-2.7.tar.gz
> just a small note because the buildroot doc says hash values provided by 
> upstream are prefered:

Indeed.

> Looking at http://sourceforge.net/projects/faac/files/faad2-src/faad2-2.7/ 
> you can click on the "i" button of faad2-2.7.tar.bz2 to display its md5/sha1 
> values, they could be added to our hash file instead of a locally computed 
> hash.

OK, but it is not straight-forward. Upstream as we document it is:
    http://www.audiocoding.com/faad2.html

and they have no hash that I could find on that website.

But they point the downloads to the sourceforge page.

However, I'm a bit reluctant at using hashes published by a third-party.
I guess we cn add them, plus our locally computed sha256.

Thanks for pointing this.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

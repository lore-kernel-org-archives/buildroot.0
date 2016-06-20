From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Jun 2016 19:30:23 +0200
Subject: [Buildroot] [PATCH 001/121] package/at91bootstrap: add hash file
In-Reply-To: <6f24274af1b3db00cebca0f0f104be4c@idefix.lespocky.dyndns.org>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
 <5375395bb8adb2ba08b148d702afb01c1f41f553.1466334225.git.yann.morin.1998@free.fr>
 <6f24274af1b3db00cebca0f0f104be4c@idefix.lespocky.dyndns.org>
Message-ID: <20160620173023.GC3502@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexander, All,

On 2016-06-20 15:28 +0200, Alexander Dahl spake thusly:
> Am 2016-06-19 13:08, schrieb Yann E. MORIN:
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  boot/at91bootstrap/at91bootstrap.hash | 2 ++
> >  1 file changed, 2 insertions(+)
> >  create mode 100644 boot/at91bootstrap/at91bootstrap.hash
> > 
> > diff --git a/boot/at91bootstrap/at91bootstrap.hash
> > b/boot/at91bootstrap/at91bootstrap.hash
> > new file mode 100644
> > index 0000000..0c4ef5f
> > --- /dev/null
> > +++ b/boot/at91bootstrap/at91bootstrap.hash
> > @@ -0,0 +1,2 @@
> > +# localy computed
> > +sha256 
> > d66192a274247f4baa39fa932eadf903d7add55641d89d30402f967c4f2282a5 
> > AT91Bootstrap1.16.zip
> 
> Acked-by: Alexander Dahl <post@lespocky.de>
> ---
> compared with zip downloaded and stored here long ago by ptxdist ? ;-)

Already applied by Peter, but thanks nonethless for the test! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

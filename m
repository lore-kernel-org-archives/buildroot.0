From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Oct 2014 23:10:33 +0200
Subject: [Buildroot] [PATCH] squidguard: new package
In-Reply-To: <543F9CBD.2010705@oliseo.fr>
References: <1412800692-17755-1-git-send-email-guillaume.gardet@oliseo.fr>
 <87eguf8uft.fsf@dell.be.48ers.dk> <543F9CBD.2010705@oliseo.fr>
Message-ID: <20141017211033.GG3971@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Guillaume, All,

On 2014-10-16 12:23 +0200, Guillaume GARDET - Olis?o spake thusly:
> Le 10/10/2014 23:51, Peter Korsgaard a ?crit :
> >>>>>>"Guillaume" == Guillaume GARDET <guillaume.gardet@oliseo.fr> writes:
[--SNIP--]
> >  > diff --git a/package/squidguard/Config.in b/package/squidguard/Config.in
> >  > new file mode 100644
> >  > index 0000000..8d3c28e
> >  > --- /dev/null
> >  > +++ b/package/squidguard/Config.in
> >  > @@ -0,0 +1,24 @@
> >  > +comment "squidguards needs Squid"
> >  > +	depends on !BR2_PACKAGE_SQUID
> >
> >squid should not be capitalized. I don't know much about squid and these
> >plugins, but would anybody needing this NOT enable squid just above
> >already? Perhaps the comment isn't really needed?
> 
> I think it is better to keep it but if you think I should remove it, I will. Just tell me.

I side with Peter here. Squid is an obvious dependency of squidguard, so
the comment is not needed.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

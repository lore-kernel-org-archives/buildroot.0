From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Feb 2019 14:44:20 +0100
Subject: [Buildroot] [PATCH 9/12] package/mongodb: add boost mandatory
 dependency
In-Reply-To: <20190210143358.321d5bd8@windsurf.home>
References: <20190210114528.1753-1-fontaine.fabrice@gmail.com>
 <20190210114528.1753-9-fontaine.fabrice@gmail.com>
 <20190210140655.6b6ce932@windsurf.home>
 <CAPi7W81_SdnBOb2qUXac4K614Wqmk9_+1whpps99UDe9vXXnaA@mail.gmail.com>
 <20190210143358.321d5bd8@windsurf.home>
Message-ID: <20190210134420.GL3079@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-02-10 14:33 +0100, Thomas Petazzoni spake thusly:
> On Sun, 10 Feb 2019 14:22:39 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> 
> > > I don't understand PATCH 9/12, 10/12 and 11/12. If those are mandatory
> > > dependencies, mongodb will not build after PATCH 8/12 is applied.  
> > mongodb will build after patch 8/12 because it embeds all its external
> > dependencies in src/third_party. Path 9 to 12 enable the system
> > libraries instead of the embededded ones.
> 
> OK.
> 
> > However, as suggested by Yann in a separate email, I'll create a
> > mongodb-4 package and put all the mongodb related changes in a single
> > "new mongodb-4 package" patch.
> 
> Why should it be named mongodb-4 and not just mongodb, since we're
> anyway no longer going to have a mongodb package that provides the 3.x
> version ?

Right, I just used 'mongodb-4' as a way to identify that it was mongodb
4.x I was talking about. The package should indeed be named 'mongodb'.

Sorry for the confusion.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

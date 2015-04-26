From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Apr 2015 16:12:15 +0200
Subject: [Buildroot] [PATCHv3 07/18] pkg-generic: implement source-check
 targets
In-Reply-To: <20150426113904.7efb27c0@free-electrons.com>
References: <1429972982-25495-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1429972982-25495-8-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150425172837.GI4275@free.fr>
 <20150426113904.7efb27c0@free-electrons.com>
Message-ID: <20150426141215.GA4809@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-26 11:39 +0200, Thomas Petazzoni spake thusly:
> On Sat, 25 Apr 2015 19:28:37 +0200, Yann E. MORIN wrote:
> > To be noted: packages hosted at github, when we download a released
> > tarball, are broken, because the backing-store is AWS, which does not
> > support the HEAD request. But that is not a change due to this patch, it
> > was already broken previously.
> 
> Right. Let's not fix all the problems in this patch series :-)

Of course not. Just sayin'...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

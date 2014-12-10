From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Dec 2014 22:28:21 +0100
Subject: [Buildroot] [PATCH v2 1/4] libfm-extra: new package
In-Reply-To: <20141210221006.5ab0d254@free-electrons.com>
References: <1416583990-35169-1-git-send-email-Vincent.Riera@imgtec.com>
 <20141210205715.GE3926@free.fr>
 <20141210221006.5ab0d254@free-electrons.com>
Message-ID: <20141210212821.GI3926@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-12-10 22:10 +0100, Thomas Petazzoni spake thusly:
> On Wed, 10 Dec 2014 21:57:15 +0100, Yann E. MORIN wrote:
> 
> > Also, the only file that seem to get compiled is:
> >     src/extra/fm-xml-file.c
> > 
> > for which the header states it is LGPLv2.1+.
> > 
> > So, even if there's only the COPYING for the GPLv2 and that we only
> > compile an LGPLv2.1+ file, I'd state both licenses.
> 
> I'm not sure here: since some files of the library are under the GPL,
> the library as a whole is under the GPL, even though some parts of it
> are under other licenses.

Yes, the GPL gobbles up the LGPL, because of its stronger requirements.
But licensing wise, they are both applicable licenses.

Even worse in this case, the resulting combination is probably just
LGPLv2.1+, since the only compiled file is LGPLv2.1+.

So, I'd prefer we stride on the safe side, and include both licenses,
and delegate to the user (and/or his legal team) the decision as to what
license is applicable.

We are not lawyer, and this is a complicated matter.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 23 Sep 2014 23:56:22 +0200
Subject: [Buildroot] [PATCH 18/23 v5] docs: separate the GENDOC infra
 from our manual definition
In-Reply-To: <CAHXCMMKPMg-S1pYckGZ0re-b+S6yVW24V0kU1orCpmuZkUVw9w@mail.gmail.com>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
 <308773fe2883c6a3a4e13be8fdabcf3f2ba6c42a.1410692670.git.yann.morin.1998@free.fr>
 <CAHXCMMKPMg-S1pYckGZ0re-b+S6yVW24V0kU1orCpmuZkUVw9w@mail.gmail.com>
Message-ID: <20140923215622.GB4283@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-09-22 22:42 +0200, Samuel Martin spake thusly:
> On Sun, Sep 14, 2014 at 1:07 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > Move the GENDOC infra to its own file, so it is even less tied to our
> > manual document, so that it is more obvious that GENDOC is an infra like
> > our packages infras, and 'manual' is a document like we have packages.
[--SNIP--]
> > +MANUAL_XSLTPROC_IS_BROKEN = \
> 
> Maybe  this variable could be renamed as well.
> It is more related to asciidoc/a2x than specific tou Buildroot's manual.

Right, I'll rename it too, but not in that patch. I'll rename in the
patch titled:
    docs/manual: do not hardcode name of the generated document

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

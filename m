From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 6 Sep 2016 22:58:35 +0200
Subject: [Buildroot] [PATCH 6/9 v4] docs/manual: document the
 br2-external NAME
In-Reply-To: <b5a5d20b-25b3-7a83-0f7b-1b9d00ca616a@ecagroup.com>
References: <cover.1473109655.git.yann.morin.1998@free.fr>
 <5b0e806ca88df47f4e5221cf4bbe7a60ed79c867.1473109655.git.yann.morin.1998@free.fr>
 <b5a5d20b-25b3-7a83-0f7b-1b9d00ca616a@ecagroup.com>
Message-ID: <20160906205835.GB12105@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, All,

On 2016-09-06 10:21 +0000, Julien CORJON spake thusly:
> Le 05/09/2016 ? 23:49, Yann E. MORIN a ?crit :
> > Update the manual with the new external.desc mandatory file.
> >
> > Take the opportunity to add a section listing all mandatory files,
> > Config.in, external.mk and the new external.desc, instead of just
> > hinting about them in the external package recipes section.
> >
> > Change the examples to use the NAME-suffixed variable instead of the
> > raw BR2_EXTERNAL variable. Even though it is still possible to write
> > a br2-external tree that has no NAME (ie.e. won't be multi-aware), we
> > only document it with an NAME.
> 
> Is it really possible to have an br2-external tree that has no NAME from 
> here? Or, as you said in the series resume it's not possible anymore?

Damn, I somehow did something (aborted rebase somewhere?) becasue I was
sure I did ammend that commit log...

No, it's no longer possible.

I'll fix the commit log (for good this time, I hope!).

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

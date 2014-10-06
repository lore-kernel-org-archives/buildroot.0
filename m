From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Oct 2014 19:17:59 +0200
Subject: [Buildroot] [PATCH] libxml2: Add patch to remove weak symbol
 trickery
In-Reply-To: <1744839.Qfi6dWdBgg@hyperion>
References: <1410410325-23801-1-git-send-email-maarten@treewalker.org>
 <20141005193557.25145932@free-electrons.com>
 <1744839.Qfi6dWdBgg@hyperion>
Message-ID: <20141006171759.GA4122@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maarten, All,

On 2014-10-06 01:29 +0200, Maarten ter Huurne spake thusly:
> On Sunday 05 October 2014 19:35:57 Thomas Petazzoni wrote:
> > On Thu, 11 Sep 2014 06:38:45 +0200, Maarten ter Huurne wrote:
> > > This avoids runtime problems when linking libpthread statically and it
> > > fixes compilation with musl libc.
> > > 
> > > The patch is based on this one:
> > >   https://github.com/sabotage-linux/sabotage/blob/master/KEEP/libxml2-pt
> > >   hread.patch> 
> > > I added the configure modification to ensure that libxml-2.0.pc will
> > > list libpthread as a private dependency.
> > 
> > Missing SoB line.
> 
> Is there a policy for including 3rd party patches? In this case the fragment 
> I took from Sabotage Linux only removes code, so I don't think there could 
> be any copyright issues there (no creativity involved), but in general would 
> my SoB line be sufficient or would I need one from the 3rd party author as 
> well?

When using a patch from somewhere else:
  - take the patch as-is,
  - add to the description of that patch the URL where you got it: an
    upstream commit, a bug-tracker, a mailing...
  - add your own SoB line.

That way, proper attribution is done, both for the original author(s)
and you.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 12 Sep 2013 23:51:52 +0200
Subject: [Buildroot] [PATCH 0/3] Support for out-of-tree Buildroot
 customization
In-Reply-To: <20130912202157.536e5904@skate>
References: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <OF0AEEFBDE.5291EB54-ON86257BE3.0005DA76-86257BE3.00087A88@rockwellcollins.com>
 <20130911091700.0b24df41@skate>
 <OFA3C6DE52.DF6BBCA7-ON86257BE3.0054A3F9-86257BE3.00577394@rockwellcollins.com>
 <20130911172709.GB3410@free.fr>
 <CAAXf6LVD590fVudge3Fk+2B8pSzvUEV2GQLTcbz=VpOB2HCmtQ@mail.gmail.com>
 <20130912202157.536e5904@skate>
Message-ID: <20130912215152.GC3362@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-09-12 20:21 +0200, Thomas Petazzoni spake thusly:
> On Thu, 12 Sep 2013 09:54:56 +0200, Thomas De Schampheleire wrote:
> 
> > > Yes, as I said above, I would have expected companies (well, people at
> > > companies) be stressed by projects deadlines, and that they would work
> > > in BR2_EXTERNAL, and only try to upstream later, when it would be too
> > > late (for them!) to have proper reviews, since they would be internally
> > > committed to their changes in BR2_EXTERNAL, and we would not be able to
> > > take their changes.
> > >
> > > But if people use BR2_EXTERNAL as a fallback for anything that did not
> > > make it upstream (by lack of time, or of interest), or for purely
> > > internal stuff, then I don't see a reason for concern. All the better! :-)
> > >
> > 
> > Not to ruin the atmosphere, but even though Ryan and his colleagues
> > may be using BR2_EXTERNAL 'the good way', ultimately helping the
> > buildroot project with their contributions, the danger of others not
> > doing that is still real. Of course, _not_ contributing changes made
> > in a company project was also possible previously, without
> > BR2_EXTERNAL, so this is no reason to block the patchset.
> 
> Yes, that's what I believe: companies and people are forking Buildroot
> nowadays. As I highlighted in my reply to Yann's e-mail, BR2_EXTERNAL
> may in fact encourage companies in separating their specific changes
> from the changes that could potentially be upstreamed, and therefore
> encourage upstream.
> 
> I really don't think BR2_EXTERNAL is going to make things worse in
> terms of upstreaming.

Agreed.

It makes it easier fro them not to upstream, but since it was not
complex to do so before, that does virtually change nothing.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

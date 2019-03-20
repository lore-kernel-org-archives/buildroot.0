From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 20 Mar 2019 10:29:30 +0100
Subject: [Buildroot] [RFC PATCH] package/libcamera: Add libcamera package
In-Reply-To: <824b7b41-dbdd-69f5-9c20-8965c95db69e@ideasonboard.com>
References: <20190319110326.15153-1-kieran.bingham@ideasonboard.com>
 <20190319125040.GA2702@scaer>
 <940dcdca-91e1-9460-35f7-782959a7ad02@ideasonboard.com>
 <100d21c9-da59-239c-29b2-e6d5bb38106d@mind.be>
 <824b7b41-dbdd-69f5-9c20-8965c95db69e@ideasonboard.com>
Message-ID: <20190320092930.GI2702@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kieran, All,

On 2019-03-20 09:25 +0000, Kieran Bingham spake thusly:
> On 19/03/2019 23:18, Arnout Vandecappelle wrote:
> >  AFAIU, we only specify licenses of stuff installed on target. Since
> > /usr/share/doc gets removed in target-finalize, the doc license should not be
> > relevant.
> Ok, so should I just remove the CC licence?

Yes, drop it both from the list and the files-list.

> Are all of these relevant actually? I wonder if I should drop the
> cc-by-sa-v4.0 if I'm dropping the docs licence above, and the DCO, as
> that's only really about contributing to the project?

Yes, drop the CC license and the DCO.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 May 2013 13:38:44 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-05-16
In-Reply-To: <20130517200122.42592574@skate>
References: <20130517063004.5C9B352C0F6@lolut.humanoidz.org>
 <20130517200122.42592574@skate>
Message-ID: <20130518113844.GA3050@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2013-05-17 20:01 +0200, Thomas Petazzoni spake thusly:
> On Fri, 17 May 2013 08:30:04 +0200 (CEST), Thomas Petazzoni wrote:
> > Build statistics for 2013-05-16
> > ===============================
> > 
> >         success : 79 
> >        failures : 47 
> >        timeouts : 3  
> >           TOTAL : 129
> 
> I have augmented the timeout duration from 2 hours to 4 hours, which
> should hopefully help get rid of those false positives.

Sounds good.

> Also, I propose to remove the timeouts from the list of failures in the
> automated e-mail, and only list them in the success/failures/timeouts
> summary above. They're just noise in the list of failures. Any
> objection to this?

If the timeouts number rises again, we can then start investigating.
Until then, they are just spurious, and I doubt they are really
meaningfull. So, I agree, let's remove them from the report.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

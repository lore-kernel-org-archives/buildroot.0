From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 9 Aug 2016 23:23:28 +0200
Subject: [Buildroot] Analysis of build results for 2016-08-08
In-Reply-To: <20160809175858.GA5779@free.fr>
References: <20160809063032.89898101A55@stock.ovh.net>
 <20160809141535.4c9b8169@free-electrons.com>
 <20160809175858.GA5779@free.fr>
Message-ID: <20160809212328.GH5779@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Maxime, All,

On 2016-08-09 19:58 +0200, Yann E. MORIN spake thusly:
> On 2016-08-09 14:15 +0200, Thomas Petazzoni spake thusly:
> > >          arm | kmsxx-a706f157b86e906968080... | NOK | http://autobuild.buildroot.net/results/1f005c46b927fbeeffb11d843c2c3f18308bb5b9/
> > Lots and lots of errors. Maxime, Yann, any idea?
> 
> This is a static build, so it looks like it is missign a library to
> link to. I've started a build here to investigate a bit more...

I am not able to reproduce this build failure... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

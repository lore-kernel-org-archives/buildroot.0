From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Oct 2013 14:26:14 +0200
Subject: [Buildroot] [PATCH] Allow PHP to compile ans link with
 berkeleydb 6
In-Reply-To: <5252A7DF.5020008@zacarias.com.ar>
References: <1381146130-8575-1-git-send-email-jezz@sysmic.org>
 <20131007135727.3cb4150d@skate> <5252A7DF.5020008@zacarias.com.ar>
Message-ID: <20131007142614.45304395@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 07 Oct 2013 09:23:59 -0300, Gustavo Zacarias wrote:
> On 10/07/2013 08:57 AM, Thomas Petazzoni wrote:
> > Therefore, linking PHP with BerkeleyDB version 6 creates a PHP binary
> > that cannot legally be distributed.
> > 
> > If this analysis is correct, I'd suggest one of the following options:
> > 
> >  * Drop the support for BerkeleyDB support in PHP.
> > 
> >  * Add a berkeleydb5 package that packages the last known non-AGPL
> >    version of BerkeleyDB, and use that for PHP.
> > 
> > Considering how useful BerkeleyDB can be with PHP, I'm suggesting the
> > first option.
> 
> You mean the second option right?
> Otherwise you're conflicting with yourself ;)

Sorry, I forgot to add a smiley or something. To be "how useful
BerkleyDB can be with PHP" was ironic, so I was actually meaning that I
don't think PHP+BerkeleyDB is so useful, so that to me, the first
option is perfectly acceptable.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

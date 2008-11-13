From: Fredrik Israelsson <fredrik_is@hotmail.com>
Date: Thu, 13 Nov 2008 12:42:13 +0000
Subject: [Buildroot] When NOT to use buildroot
In-Reply-To: <e4c675870811130330m1368e41dqed1dd63721436b7f@mail.gmail.com>
References: <BLU141-W39C24243561D47921E0007EF170@phx.gbl>
	<e4c675870811130330m1368e41dqed1dd63721436b7f@mail.gmail.com>
Message-ID: <BLU141-W422A2D2F9C703FB4C827CFEF170@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Thank you, that sounds reasonable,
 
but I do not want the OS on the target machine to be upgradable from the target machine. I want to be able to create a target OS in my development environment, and deploy it on my target machine. Can that be done without using an external OS building tool? You can?t remove apt from Ubuntu using tools within Ubuntu, or can you?
Is buildroot the only OS building tool, or are there other ones out there, perhaps more suitable for building a bit larger systems than the ones buildroot aims at?
 
/Fredrik
> Date: Thu, 13 Nov 2008 12:30:27 +0100> From: roberto.foglietta at gmail.com> To: fredrik_is at hotmail.com> Subject: Re: [Buildroot] When NOT to use buildroot> CC: buildroot at uclibc.org> > 2008/11/13 Fredrik Israelsson <fredrik_is@hotmail.com>:> > Hi!> > I think it would help a lot if I could get some information regarding when> > NOT to use buildroot.> >> > For instance,> > if I would like to build a system that is almost like an embedded system,> > but a bit more capable (read bloated), would it get too complicated building> > the system from the ground up using buildroot?> >> > I am thinking of using a not so tiny database, like PostgreSQL or MySQL, a> > rich GUI, perhaps using Java. At the same time I would really like to not> > use more of the OS that the system needs.> >> > What about using CUPS or some other utility to provide flexible printer> > support? Would I be better off if I chose to strip down Ubuntu 8.04, for> > instance, in order to gain support for jacking in USB printers?> >> > My main reason for keeping the OS tiny is simplicity. Hard drive size is not> > a limitation.> >> > Hi Fredrik,> > simplicity = a good package manager + an update support> > this sound me like:> > - debian> - ubuntu server edition (my preference)> - gentoo (or gentoo embedded)> > As simple as possible for what? Who cares if a server is a little bit> bloated (apart security reasons which force you to remove everything> is not useful)? The admin cares in doing the most of things in the> less time. Administrative tools should be as simple as possible,> reliable, etc. etc. I think you are good in looking for simplicity but> you are looking in the wrong direction: do not care about bloating the> system until hard disk space is a limitation and until it hurts> security but care about simple administrative procedure and tools.> Services like: upgrade and security audit, etc. etc.> > Ciao,> -- > /roberto
_________________________________________________________________
Var sommaren f?r kort? H?r hittar du solen!
http://resor.se.msn.com/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081113/2618c16e/attachment.htm 

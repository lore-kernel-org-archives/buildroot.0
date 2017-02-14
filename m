From: Carlos Santos <casantos@datacom.ind.br>
Date: Tue, 14 Feb 2017 09:20:00 -0200 (BRST)
Subject: [Buildroot] [PATCH v2] python-lxml: allow build as host package
In-Reply-To: <1485971468-3709-1-git-send-email-casantos@datacom.ind.br>
References: <1485179476-6049-1-git-send-email-casantos@datacom.ind.br>
 <1485971468-3709-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <373030528.10239603.1487071200627.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Carlos Santos" <casantos@datacom.ind.br>
> To: buildroot at buildroot.org
> Cc: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> Sent: Wednesday, February 1, 2017 3:51:08 PM
> Subject: [Buildroot] [PATCH v2] python-lxml: allow build as host package

> While currently there is no in-tree Buildroot package which depends on
> host-python-lxml, we (DATACOM) have some proprietary modules that use it
> in their test scripts.
> 
> We tested python-lxml as host package and confirmed that it builds and
> works correctly. Someone else might require it, so we are proposing its
> inclusion.

Hello,

Any news about this proposal? I think it could fall into the new policy of
"loosen up a little on accepting host tools"[1] if I add the corresponding
Config.in.host, right? I know I'm pushing here, but host-python-lxml would
help us (DATACOM) to have more reproducible builds.

1. http://elinux.org/Buildroot:DeveloperDaysFOSDEM2017#Host_packages_with_no_in-tree_user

Carlos Santos (Casantos) - DATACOM, P&D
?Something must be done. This is something. Therefore we must do it.?
(from the BBC series ?Yes, Prime Minister?, ?Power to the people?)

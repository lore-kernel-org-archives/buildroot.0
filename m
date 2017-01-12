From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 12 Jan 2017 10:30:57 -0200 (BRST)
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-01-11
In-Reply-To: <20170112072936.BAC98207D1@mail.free-electrons.com>
References: <20170112072936.BAC98207D1@mail.free-electrons.com>
Message-ID: <1397774101.6731830.1484224257049.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Sent: Thursday, January 12, 2017 5:29:36 AM
> Subject: [autobuild.buildroot.net] Your build results for 2017-01-11

> Hello,
> 
> This is the list of Buildroot build failures that occured on
> 2017-01-11, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
> 
> Build failures related to your packages:
> 
>     powerpc |                util-linux-2.29 |
>     http://autobuild.buildroot.net/results/3a2f228e0fa7b5cc28a13d49f48f1a6aef8d9d7a
>     powerpc |                util-linux-2.29 |
>     http://autobuild.buildroot.net/results/99e96069f652d511c6212a5bb6be29e68fb1747c
> microblazeel |                util-linux-2.29 |
> http://autobuild.buildroot.net/results/2dc5721aef93b7b410153bafad78248fac3db941
> 
> --
> http://autobuild.buildroot.net

Looks like the recent attempts to fix the util-linux + ncurses + wchar problem were
not successful. I will take a look at this tonight.

Carlos Santos (Casantos) - DATACOM, P&D
?Something must be done. This is something. Therefore we must do it.?
(from the BBC series ?Yes, Prime Minister?, ?Power to the people?)

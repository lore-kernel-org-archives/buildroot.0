From: gwenhael.goavec <gwenj@trabucayre.com>
Date: Tue, 20 Jun 2017 10:54:06 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-06-19
In-Reply-To: <20170620062720.1639020978@mail.free-electrons.com>
References: <20170620062720.1639020978@mail.free-electrons.com>
Message-ID: <8b3d9ad26dec90224cf356b564a512d5@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello,

On Tue, 20 Jun 2017 08:27:20 +0200 (CEST)
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>   
[...]
> | arm |               librtlsdr-v0.5.3 | NOK |
http://autobuild.buildroot.net/results/040c5270f9315e83c723687eefad764aa0d6d500
 

This build issue is due to the "inline" keyword. I'm dont know if I
must provide a patch to suppress these keywords or if it's an other
problem.

Gwen

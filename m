From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 25 Jan 2007 11:55:39 +0100
Subject: [Buildroot] Make problems
In-Reply-To: <D10BFA8BB60FBC43849BFB49875965CC02D9C4@MCHP7IEA.ww002.siemens.net>
References: <D10BFA8BB60FBC43849BFB49875965CC02D9C4@MCHP7IEA.ww002.siemens.net>
Message-ID: <20070125105539.GA16789@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 25, 2007 at 10:15:12AM +0100, Kleegrewe, Christian wrote:
>Hi all,
>
>I tried to integrate a simple software project into the buildroot, but it does not compile. The problem is, that the compilation process is not started. The target is added correctly to TARGETS and the copying at the beginning of the hello.mk is performed correctly, but the $(MAKE) is never called. I suspect that it is a problem with the definition of the corresponding target.


>I tried to find a sollution for my problem in the mailing list archives, but it is difficult to search.

http://buildroot.uclibc.org/lists.html
http://buildroot.uclibc.org/buildroot.html#add_software

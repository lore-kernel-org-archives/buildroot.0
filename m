From: Kai Moritz <kai@ich-geh-kaputt.de>
Date: Tue, 19 Feb 2008 16:03:33 +0100
Subject: [Buildroot] How to build MIPS cross compiler
In-Reply-To: <f185607a0802190354v51d3e721ib9678782e72252f1@mail.gmail.com>
References: <f185607a0802190354v51d3e721ib9678782e72252f1@mail.gmail.com>
Message-ID: <47BAEFC5.9080609@ich-geh-kaputt.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mile Davidovic schrieb:
> Hello,
> I am trying to build MIPS based toolchain, but unfortunately I got
> error with unsupported ABI.
>   
Hi Mile,

I have the same problem.
I have tried out all available combinations of mips and ABI.
None of them worked...

Bernhard Fischer (rep.dot.nop at gmail.com) send me a link to his personal 
git-Branch of buildroot, which is slightly older than trunk from svn.
That branch worked for me.
But I do not know, if it will be merged back into trunk, or when...

Greetings

Kai Moritz

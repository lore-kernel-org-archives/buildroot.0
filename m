From: Sergey Naumov <sknaumov@gmail.com>
Date: Thu, 4 Mar 2010 18:52:07 +0300
Subject: [Buildroot] Modules architecture
In-Reply-To: <7627a87b1003030746r4cdb3cc3l99d1d2ffafcf6950@mail.gmail.com>
References: <7627a87b1003030251o5313e124ofd6b99e7f0a55cc@mail.gmail.com>
	<20100303160321.5ff87861@surf>
	<7627a87b1003030746r4cdb3cc3l99d1d2ffafcf6950@mail.gmail.com>
Message-ID: <7627a87b1003040752l20d7121fm9f180b3f55f620b9@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
> Hello again.
If it is interesting for you, I overcome the problem with "invalid module
format" through deleting target "modules" in
./target/linux/Makefile.in.advanced in modules-building section, so "make"
is invoked there without targets. So now my kernel image builds along with
modules.
But the question is should it be considered as buildroot bug or as my fault
with configs?

Sergey.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100304/ca74d756/attachment.htm>

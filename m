From: Ravi Dantaliya <ravidantaliya1611@gmail.com>
Date: Wed, 16 Dec 2015 18:04:40 +0530
Subject: [Buildroot] Not build for static library while using Buildrooot
	plugin in eclipse integration
Message-ID: <CACmqLPurk3pMCMS9aZd9_Bv7xF8Jx4hd_z4GN9pqscGjixqmDg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

1. I have been using eclipse-sr2(CDT) last 11 months.
2. I am little bit aware of cross compile within eclipse.

3. I have installed Buildroot plugin from "
http://buildroot.org/downloads/eclipse/kepler-sr2/".
    After that for testing I have create simple library project as follow:
       File->New->C Project->Static Library
       Toolchain: Buildroot(MIPS)

4. Go to project property->C/C++ Build->Setting->Build Artifact
    In that can't find "static" only two we have select: (i) Executable
(ii) Shared
    But couldn't find "static"

5. I have changed the Toolchain "Buildroot(MIPS)" to "Linux GCC"
    Then I have seen the "static" option into Build Artifact tab.

I don't know why Buildroot Toolchain not taking "static"?
Any Ideas.

RD
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151216/1359ff96/attachment.html>

From: Mirza Krak <mirza.krak@northern.tech>
Date: Fri, 10 Aug 2018 13:34:06 +0200
Subject: [Buildroot] pkg-golang: host package not supported
Message-ID: <CADHdJwDuaeDU_G0ePRPRrWw+3Vo4W0mSx45OuEDnqrgnsKgZQA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

I have recently started doing some work with Buildroot and
specifically I am building packages that are based on golang.

Build packages for "target" works just fine. But I noticed that the
pkg-golang.mk [1] does not support "host" target yet [2] which is
required for one my packages.

Buildroot is new to me but looking at pkg-golang.mk it does _not_ seem
that a lot of needs to change to support "host" packages as well.

So two questions:
- Any specific reason "host" target is not supported?
- Any hints on to add host-golang-package support?

Thanks.

[1]. https://github.com/buildroot/buildroot/blob/master/package/pkg-golang.mk
[2]. https://github.com/buildroot/buildroot/blob/master/package/pkg-golang.mk#L47

-- 
Mirza Krak | Embedded Solutions Architect | https://mender.io

 Northern.tech AS | @northerntechHQ

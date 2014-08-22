From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 22 Aug 2014 15:32:18 +0200
Subject: [Buildroot] Include custom kernel headers
Message-ID: <CAGm1_ksQ5BEi1PSdbDzjZTy=szt9DMe0PQAKvZgai-SFt_oh-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm compiling a custom kernel using local.mk facility. In this kernel
I want extend some kernel structures, that then must be visible in
user space. How can I include these custom kernel headers?

Regards,
Yegor

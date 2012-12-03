From: Bogdan Radulescu <bogdan_radulescu99@yahoo.com>
Date: Mon, 3 Dec 2012 14:20:07 -0800 (PST)
Subject: [Buildroot] elfutils and the perf userspace tool
Message-ID: <1354573207.60693.YahooMailNeo@web120305.mail.ne1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Hello everybody,

I am using buildroot for generating a distro for ARM. I am able to add additional packages to buildroot or to use arm-linux-gcc directly to compile simple C programs.

Still I haven't yet understood how to cross compile the perf userspace tool and I think it would be a very nice addition to buildroot.

The perf tool requires elfutils and the kernel sources it comes with.

My first problem is that elfutils will not successfully compile, as you can see here:
http://pastie.org/pastes/5474687/text

My elfutils.mk file looks like this http://pastie.org/pastes/5474697/text

Please tell me how do I move further from this.

Thanks,
Bogdan

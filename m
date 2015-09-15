From: Brendan Heading <brendanheading@gmail.com>
Date: Tue, 15 Sep 2015 22:54:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/sudo: disable use of stack
 protector when not available
In-Reply-To: <20150915234417.4658d78e@free-electrons.com>
References: <1442342953-20312-1-git-send-email-brendanheading@gmail.com>
 <20150915233014.27cc4a34@free-electrons.com>
 <CA+BsyQ7-YdWiOQ9E0X_+vppuB0hNdVPNV7kai9UW+1Kz5G8s3w@mail.gmail.com>
 <20150915234417.4658d78e@free-electrons.com>
Message-ID: <CA+BsyQ4UcfDLxGK5+_AbdVcngzUM_fn=ab6fxHOLFp3pepDi7Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I have nothing against your patch in principle, it can only be good to
> explicitly disable stack protector usage when the necessary support is
> not there. I'm just curious to understand why the detection does work
> in certain cases and not in others.

Understood Thomas. I'll have a closer look and see what's going on.

Brendan

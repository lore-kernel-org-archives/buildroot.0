From: Amit Uttamchandani <amit.uttam@gmail.com>
Date: Mon, 20 Jul 2009 16:03:20 -0700
Subject: [Buildroot] libgcc build error on arm
In-Reply-To: <20090720121200.05b9f0b5@debian.canoga.com>
References: <20090720121200.05b9f0b5@debian.canoga.com>
Message-ID: <20090720160320.46ee4d2b@debian.canoga.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 20 Jul 2009 12:12:00 -0700
Amit Uttamchandani <amit.uttam@gmail.com> wrote:

> 
> Using the latest git source I get following build error when building
> a toolchain for arm (build log can be found at end of message):
> 

[snip]

Solved by using the following:

Target architecture: arm
Target architecture variant: generic_arm
Target ABI: OABI

Thanks,
Amit

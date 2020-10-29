From: Michael Nosthoff <buildroot@heine.tech>
Date: Thu, 29 Oct 2020 14:06:45 +0100
Subject: [Buildroot] 
 =?utf-8?q?=5BPATCH=5D_package/libgpiod=3A_bump_versi?=
 =?utf-8?q?on_to_1=2E6?=
In-Reply-To: <20201029135017.652486f7@windsurf.home>
Message-ID: <7e-5f9abe80-1-60a72780@84134619>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
 
On Thursday, October 29, 2020 13:50 CET, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote: 

> 
> Hum, this is a bit annoying. And upstream is not willing to have proper
> conditional logic to keep supporting kernels older than 5.5 ? 5.5 is
> not that old, it seems odd to so quickly drop support. Even 5.4 is the
> current LTS kernel !

At least that's how I interpret this comment in the NEWS for 1.5 [0]:

- added support for bias flags which are a new functionality first available in
  linux v5.5; subsequently the library now requires v5.5 kernel headers to
  build;

But maybe Bartosz can clarify on this, as he basically is the "upstream" :)


Regards,
Michael

[0] https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/NEWS

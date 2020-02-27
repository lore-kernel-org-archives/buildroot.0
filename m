From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Feb 2020 15:26:48 +0100
Subject: [Buildroot] Rebuild host package
In-Reply-To: <CAOqJNTfytEYT7=EWupa-Gy=e3Rg=ngweN+-KqcPFKyFf_wmCPQ@mail.gmail.com>
References: <CAOqJNTfytEYT7=EWupa-Gy=e3Rg=ngweN+-KqcPFKyFf_wmCPQ@mail.gmail.com>
Message-ID: <20200227152648.61a70847@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 27 Feb 2020 15:11:18 +0200
Serhii Sakhno <sergei.sakhno@gmail.com> wrote:

> I added host package and they build on the first build of the system. But
> its package in developing state, and need to rebuild him some times. How I
> can do it? For example, target package I can rebuild:
> {package_name}-rebuild
> But with host package its doesn't work.

It should work in exactly the same way:

	make host-foo-rebuild

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

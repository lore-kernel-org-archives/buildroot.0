From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Feb 2018 13:41:11 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/llvm: new host package
In-Reply-To: <CALoSW6517hOpJqRgUPcVkbG+hpso1VcOagOrhxG4nqtLHg=D9Q@mail.gmail.com>
References: <20180219171805.13769-1-valentin.korenblit@smile.fr>
 <20180219171805.13769-2-valentin.korenblit@smile.fr>
 <20180219212213.33f289c4@windsurf.home>
 <8d272d0a-d3bc-b9c9-6cfc-ca1164cc7032@smile.fr>
 <CALoSW6517hOpJqRgUPcVkbG+hpso1VcOagOrhxG4nqtLHg=D9Q@mail.gmail.com>
Message-ID: <20180220134111.0807307e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Feb 2018 12:13:54 +0000, Nimai Mahajan wrote:

> I can test this today at work, but I am using the same target architecture
> as you, x86. We use this sw rasturizer with a Qt5 app on an old atom
> platform (that has no modern kernel support for hw accelerated graphics).
> 
> I'd love to see it in 2018.02 if possible as that is BRs next LTS release
> but Thomas and the team may not be adding anymore packages there as they
> are already cutting RCs. For older platforms though, llvmpipe is pretty big
> and should be in there. The difference between that and older sw renderers
> like softpipe is tremendous.

I do realize the value of llvmpipe, and what it brings compared to
softpipe. However, we're already past 2018.02-rc2, and 2018.02 being a
LTS release, we really want to avoid introducing major changes that
close to the release.

Therefore I don't think llvm and llvmpipe support will make it to
2018.02. However, it should hopefully be in 2018.05, and you can always
backport the relevant patches if you want to stick to 2018.02 to
benefit from security updates.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com

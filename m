From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 08:33:31 +0200
Subject: [Buildroot] [PATCH 00/69] Remove automatic derivation of host
	dependencies
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <20160703083331.7b0e3282@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Jul 2016 00:20:29 +0200, Julien Floret wrote:
> The automatic derivation of host dependencies feature consists in
> automatically deducing dependencies of a package host variant from the
> dependencies of the target variant.

Thanks for this series. However, there are still a number of issues
(I'll reply to the patches independently).

But most importantly, I think it's a topic I would prefer to not have
to handle right now. We are in the middle of a Buildroot Summer Camp,
trying to reduce significantly the backlog of patches, so a 69 patches
series is kind of going against this goal. While this objective is
desirable, it's also not a super high priority, so I would have
preferred to defer this work a bit and concentrate on other topics.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

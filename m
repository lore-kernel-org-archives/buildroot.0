From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Aug 2015 09:04:25 +0200
Subject: [Buildroot] [RFC] package/pulseaudio: fix musl build
In-Reply-To: <1438370022-25257-1-git-send-email-romain.naour@openwide.fr>
References: <1438370022-25257-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150806090425.1917eff0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Fri, 31 Jul 2015 21:13:42 +0200, Romain Naour wrote:
> pulseaudio doesn't build properly on musl due to
> a OSS wrapper called padsp. It provide a software OSS
> interface on systems without OSS.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
> Patches not upstreamed yet.

Could you send your patches upstream, and see what is upstream
reaction? That's quite a bit of patches, to support a fairly odd setup
(a big thing such as pulseaudio, with a small size C library such as
musl). So I'd prefer to have such patches upstreamed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

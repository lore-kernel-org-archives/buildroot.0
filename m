From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Aug 2015 09:16:36 +0200
Subject: [Buildroot] [PATCH v2] zyre: fix static builds
In-Reply-To: <1440408666-62387-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1440408666-62387-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150826091636.55e91a3a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente,

On Mon, 24 Aug 2015 10:31:06 +0100, Vicente Olivert Riera wrote:
> zyre package fails to build statically, so we pass the needed libs
> directly in order to fix this problem.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/0ab/0ab4c6a4bb4942d51e7712073d4731d81ecb5251/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes v1 -> v2: add "Fixes" URL.

I've committed a different fix, which consists in bumping the version
of zyre. In the latest (unreleased) version of Zyre, pkg-config is used
to find zmq and czmq, which fixes the static linking scenario.

I've therefore marked your patch as Rejected in patchwork.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

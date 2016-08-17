From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Aug 2016 16:50:00 +0200
Subject: [Buildroot] [git commit branch/next] package/runc: bump version
 to cc29e3
In-Reply-To: <20160816110755.7698482132@busybox.osuosl.org>
References: <20160816110755.7698482132@busybox.osuosl.org>
Message-ID: <20160817165000.3532b18f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 Aug 2016 13:00:05 +0200, Peter Korsgaard wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=6ad14a368798619d67d68a3b297333c153230ae1
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next
> 
> Bump runc to cc29e3dded8e27ba8f65738f40d251c885030a28
> 
> This version is required by Docker Engine v1.12.0.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Ditto the bump of docker-engine to the final 1.12.0: I believe this
commit should have been made on master, and not next (since it goes
together with the docker-engine bump).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

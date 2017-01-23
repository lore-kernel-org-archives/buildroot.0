From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Jan 2017 21:09:42 +1300
Subject: [Buildroot] [PATCH 1/2] docker-engine: security bump to version
 1.12.6
In-Reply-To: <20170122213956.1805-1-peter@korsgaard.com>
References: <20170122213956.1805-1-peter@korsgaard.com>
Message-ID: <20170123210942.296a6215@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 Jan 2017 22:39:55 +0100, Peter Korsgaard wrote:
> Fixes runC privilege escalation (CVE-2016-9962).
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/docker-engine/docker-engine.hash | 2 +-
>  package/docker-engine/docker-engine.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Both applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

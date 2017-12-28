From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Dec 2017 22:19:57 +0100
Subject: [Buildroot] [PATCH v9 7/8] libcurl: add host variant
In-Reply-To: <20171228155146.18193-8-eric.le.bihan.dev@free.fr>
References: <20171228155146.18193-1-eric.le.bihan.dev@free.fr>
 <20171228155146.18193-8-eric.le.bihan.dev@free.fr>
Message-ID: <20171228221957.2a229812@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Dec 2017 16:51:45 +0100, Eric Le Bihan wrote:
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Same as host-libssh2, it's a bit annoying to force the dependency on
host-openssl, but we don't have much choice today, and you are anyway
the only user of host-libcurl at this point.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

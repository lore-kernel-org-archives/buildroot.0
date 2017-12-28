From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Dec 2017 22:11:31 +0100
Subject: [Buildroot] [PATCH v9 5/8] libssh2: add host variant
In-Reply-To: <20171228155146.18193-6-eric.le.bihan.dev@free.fr>
References: <20171228155146.18193-1-eric.le.bihan.dev@free.fr>
 <20171228155146.18193-6-eric.le.bihan.dev@free.fr>
Message-ID: <20171228221131.50fb4485@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Dec 2017 16:51:43 +0100, Eric Le Bihan wrote:
> Allow build of host variant of libssh2, which depends on host-openssl.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Long-term, it would be nice to have Config.in options for host
packages, so that we don't forcefully build openssl support in
host-libssh2, but since you're the only user for now, that's fine.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 23:10:56 +0200
Subject: [Buildroot] [PATCH] batctl: fix musl builds
In-Reply-To: <20150327170415.GA4890@vostro>
References: <20150327170415.GA4890@vostro>
Message-ID: <20150330231056.503b3c3d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Fri, 27 Mar 2015 19:04:15 +0200, Alex Suykov wrote:

> diff --git a/package/batctl/0001-musl-netinet.patch b/package/batctl/0001-musl-netinet.patch

This patch is badly named: 0001-musl-netinet, while it also fixes
things unrelated to netinet: the __be16/__be32 types. So either name it
0001-musl-fixes, or better maybe, split it in two patches.

Also, can you submit the corresponding patches upstream?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

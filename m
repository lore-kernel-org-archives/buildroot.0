From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 10 Dec 2014 17:37:23 +0000
Subject: [Buildroot] [PATCH 1/1] screen: add support for 256 colors
In-Reply-To: <20141209155728.GL2440@tarshish>
References: <1418138819-19772-1-git-send-email-tbultel@free.fr>
 <54871795.2010403@imgtec.com> <20141209155728.GL2440@tarshish>
Message-ID: <548884D3.4060409@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach, Thierry Bultel,

On 12/09/2014 03:57 PM, Baruch Siach wrote:
> I don't think the change in this separate patch is desired. We have just 
> recently (commit 963bbf266bfebc [screen: install configuration file 
> unconditionally]) switched to unconditional install of the config file.

That's right. It's trying to revert this commit:

http://git.buildroot.net/buildroot/commit/?id=963bbf266bfebc240888cf8bce502a2fadb38c48

Please don't do that. Remove that from your patch, send a new version
and mark this one as 'superseded' in patchwork.

Thanks,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Platforms
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com

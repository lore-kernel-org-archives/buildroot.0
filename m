From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Mar 2015 19:17:55 +0100
Subject: [Buildroot] [V2 1/2] ljsyscall: remove dependency on some
 architecture
In-Reply-To: <1426939298-12095-1-git-send-email-francois.perrad@gadz.org>
References: <1426939298-12095-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20150323191755.77b30833@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Sat, 21 Mar 2015 13:01:37 +0100, Francois Perrad wrote:
> ljsyscall is available for all arch supported by LuaJIT.
> refactor LJSYSCALL_ARCH : dispatch all arch.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Thanks, both patches applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

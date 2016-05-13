From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 May 2016 22:19:41 +0200
Subject: [Buildroot] [PATCH] package/turbolua: Fix optional openssl
 dependency
In-Reply-To: <1463133624-25458-1-git-send-email-m.niestroj@grinn-global.com>
References: <1463133624-25458-1-git-send-email-m.niestroj@grinn-global.com>
Message-ID: <20160513221941.5393bb2f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 13 May 2016 12:00:24 +0200, Marcin Niestroj wrote:
> turbolua fails to build when we have openssl selected, because it didn't
> mention openssl in the dependency list.
> 
> Fix build failure by specifying openssl in dependency list when it is
> selected.
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
>  package/turbolua/turbolua.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

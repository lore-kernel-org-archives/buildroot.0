From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 15:50:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/libsquish: Fix staging install
In-Reply-To: <20170429134316.30233-1-bernd.kuhls@t-online.de>
References: <20170429134316.30233-1-bernd.kuhls@t-online.de>
Message-ID: <20170429155016.0f53e493@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Apr 2017 15:43:16 +0200, Bernd Kuhls wrote:
> squish.pc was renamed upstream to libsquish.pc
> 
> Fixes
> http://autobuild.buildroot.net/results/04c/04c30f9a425d10111974a315a6d7474e243cbbd3/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libsquish/libsquish.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, after adjusting the commit title. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 14:14:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/git: fix pcre support
In-Reply-To: <20170312121203.8626-1-bernd.kuhls@t-online.de>
References: <20170312121203.8626-1-bernd.kuhls@t-online.de>
Message-ID: <20170312141410.35411898@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Mar 2017 13:12:03 +0100, Bernd Kuhls wrote:
> The current code contains some obvious typos.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/git/git.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks. Peter: this is really a bug fix, maybe we
want it for the LTS version?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

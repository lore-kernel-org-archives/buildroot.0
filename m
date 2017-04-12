From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 22:14:33 +0200
Subject: [Buildroot] [PATCH] proftpd: add mod_redis support
In-Reply-To: <20170412105619.42833-1-Vincent.Riera@imgtec.com>
References: <20170412105619.42833-1-Vincent.Riera@imgtec.com>
Message-ID: <20170412221433.1b5aa818@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Apr 2017 11:56:19 +0100, Vicente Olivert Riera wrote:
> The mod_redis module enables ProFTPD support for caching data in Redis
> servers, using the hiredis client library. This is available since
> proftpd-1.3.6rc5 and later.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Note to maintainer: this patch depends on the proftpd-1.3.6 bump:
> http://patchwork.ozlabs.org/patch/748931/
> ---
>  package/proftpd/Config.in  | 7 +++++++
>  package/proftpd/proftpd.mk | 7 +++++++
>  2 files changed, 14 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

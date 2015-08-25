From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Aug 2015 20:52:03 +0200
Subject: [Buildroot] [PATCH 1/1][v2] erlang-p1-tls: add missing
 dependency to openssl
In-Reply-To: <1440507536-29611-1-git-send-email-johan.oudinet@gmail.com>
References: <1440507536-29611-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <20150825205203.137d48eb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Johan Oudinet,

On Tue, 25 Aug 2015 14:58:56 +0200, Johan Oudinet wrote:
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> 
> ---
> Changes v1 -> v2:
>   - Add openssl dependency to the .mk file (suggested by Thomas).
> ---
>  package/erlang-p1-tls/Config.in        | 1 +
>  package/erlang-p1-tls/erlang-p1-tls.mk | 1 +
>  2 files changed, 2 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

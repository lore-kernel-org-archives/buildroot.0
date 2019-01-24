From: Anisse Astier <anisse@astier.eu>
Date: Thu, 24 Jan 2019 10:04:21 +0100
Subject: [Buildroot] [PATCH 1/1] go: security bump to 1.11.5
In-Reply-To: <20190124081633.16600-1-christian@paral.in>
References: <20190124081633.16600-1-christian@paral.in>
Message-ID: <20190124090421.sxdrfaxldf3wfhnb@bifrost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 24, 2019 at 12:16:33AM -0800, Christian Stewart wrote:
> Go 1.11.5 addresses a reported security issue, CVE-2019-6486.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/go/go.hash | 2 +-
>  package/go/go.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
Thanks Christian, that was fast ! To be fair, the issue seems severe
enough (remote DoS).

Acked-by: Anisse Astier <anisse@astier.eu>

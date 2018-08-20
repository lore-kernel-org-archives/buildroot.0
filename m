From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 17:15:36 +0200
Subject: [Buildroot] [[PATCH v2 11/14] package/mender: set version in go
 linker
In-Reply-To: <20180820130914.22377-12-mirza.krak@northern.tech>
References: <20180820130914.22377-1-mirza.krak@northern.tech>
 <20180820130914.22377-12-mirza.krak@northern.tech>
Message-ID: <20180820171536.061f0597@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Aug 2018 15:09:11 +0200, Mirza Krak wrote:
> This is used when calling the mender client with the
> -version option and it says "unknown" if not set in
> linker.
> 
> Now it displays the following:
> 
>     # mender -version
>     1.4.0
>     runtime: go1.10.2
> 
> Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

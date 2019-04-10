From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Apr 2019 19:28:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/vim: move common configure
 options to separate variable
In-Reply-To: <20190407150415.10759-1-vadim4j@gmail.com>
References: <20190407150415.10759-1-vadim4j@gmail.com>
Message-ID: <20190410192816.7ef07b4c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 Apr 2019 18:04:15 +0300
Vadim Kochan <vadim4j@gmail.com> wrote:

> Move configure options which are used for host and target to separate
> variable.
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> ---
>  package/vim/vim.mk | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)

I'm afraid we don't typically do that in most packages. We prefer to
have a clear and separate set of options for the target and host
variants.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Tue, 21 Dec 2010 23:14:16 +0200
Subject: [Buildroot] [PATCH 2/2] tslib: Enable raw module in ts.conf
In-Reply-To: <1292954816-19987-2-git-send-email-daniel.nystrom@timeterminal.se>
References: <1292954816-19987-1-git-send-email-daniel.nystrom@timeterminal.se>
	<1292954816-19987-2-git-send-email-daniel.nystrom@timeterminal.se>
Message-ID: <4D1118A8.4090005@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/21/2010 08:06 PM, Daniel Nystr?m wrote:
> By default there is no module activated in ts.conf. According to the
> ts.conf previously attached in the tslib package dir (which was never
> installed) the default module of choice was the raw module.
>
> This patch enables the raw module in the ts.conf file in the tslib
> source tree, which will be installed in the target.
>
> Signed-off-by: Daniel Nystr?m<daniel.nystrom@timeterminal.se>

I have a patch to make this a choice under Kconfig... but
Acked-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>

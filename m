From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Jul 2020 22:47:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/jq: fix license
In-Reply-To: <20200712220657.67801-1-fontaine.fabrice@gmail.com>
References: <20200712220657.67801-1-fontaine.fabrice@gmail.com>
Message-ID: <20200713224721.2614b547@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Jul 2020 00:06:57 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

>  JQ_VERSION = a17dd3248a666d01be75f6b16be37e80e20b0954
>  JQ_SITE = $(call github,stedolan,jq,$(JQ_VERSION))
> -JQ_LICENSE = MIT (code), CC-BY-3.0 (documentation)
> +JQ_LICENSE = MIT (code), ICU License (decNumber), CC-BY-3.0 (documentation)

The SPDX license code for the ICU License is just "ICU". See
https://spdx.org/licenses/. I fixed that and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

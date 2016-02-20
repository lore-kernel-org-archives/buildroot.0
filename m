From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 19:26:15 +0100
Subject: [Buildroot] [PATCH v2 07/18] erlang-p1-cache-tab: bump to
 version 1.0.1
In-Reply-To: <1454443064-14269-8-git-send-email-fhunleth@troodon-software.com>
References: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
 <1454443064-14269-8-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20160220192615.416c594f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Frank Hunleth,

On Tue,  2 Feb 2016 14:57:33 -0500, Frank Hunleth wrote:

> -ERLANG_P1_CACHE_TAB_VERSION = f7ea12b
> +ERLANG_P1_CACHE_TAB_VERSION = 1.0.1
>  ERLANG_P1_CACHE_TAB_SITE = $(call github,processone,cache_tab,$(ERLANG_P1_CACHE_TAB_VERSION))
>  ERLANG_P1_CACHE_TAB_LICENSE = GPLv2+

The license has changed, it's now Apache-2.0. I've fixed that up and
applied to the next branch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

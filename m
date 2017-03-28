From: James Balean <james@balean.com.au>
Date: Tue, 28 Mar 2017 01:14:00 -0500
Subject: [Buildroot] [PATCH] Add out-of-source U-Boot device tree support
In-Reply-To: <07d14184-7b9c-dd29-569c-db46aa765118@mind.be>
References: <1490595146-5638-1-git-send-email-james@balean.com.au>
 <07d14184-7b9c-dd29-569c-db46aa765118@mind.be>
Message-ID: <1490681640-14995-1-git-send-email-james@balean.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On 27 March 2017 at 23:12, Arnout Vandecappelle <arnout@mind.be> wrote:
>  Would it make sense to add
>         default BR2_LINUX_KERNEL_CUSTOM_DTS_PATH if BR2_LINUX_KERNEL_USE_CUSTOM_DTS
> ?

Have reconsidered this suggestion. I think that perhaps it would be best
not to make the U-boot option dependent on the Linux option. As Linux
and U-Boot use two different device tree sources, there may be occasions
when custom DTS configuration must be made to one or the other rather
than both. This is the case with my boards, which have device tree
support in Linux, but not in U-Boot.

Kind regards,
James
-- 
2.7.4

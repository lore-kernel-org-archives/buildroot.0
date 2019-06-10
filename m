From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Jun 2019 20:09:51 +0200
Subject: [Buildroot] [PATCH v4,
 1/1] package/weston: fix build with headers < 4.4
In-Reply-To: <20190610120926.5150-1-fontaine.fabrice@gmail.com>
References: <20190610120926.5150-1-fontaine.fabrice@gmail.com>
Message-ID: <b8e9b480-23c8-749e-6a82-0deab687cb20@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/06/2019 14:09, Fabrice Fontaine wrote:
> weston includes input-event-codes.h since version 5.0.91 and
> https://github.com/wayland-project/weston/commit/6e229ca26381bc8191fd9af1e439c311da709aff
> 
> input-event-codes.h is available only since kernel 4.4 and
> https://github.com/torvalds/linux/commit/f902dd893427eade90f7eaf858e5ff8b150a5a12
> 
> To fix this build failure, replace include on linux/input-event-codes.h
> by linux/input.h
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/210c2759900f15ea0030d088f6f45cd8bb199b29
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

[snip]

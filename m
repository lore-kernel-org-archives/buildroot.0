From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 23:44:37 +0100
Subject: [Buildroot] [PATCH 1/2] uclibc: Fix getopt implementations
 conditional compilation
In-Reply-To: <1426548628-29644-2-git-send-email-jcmvbkbc@gmail.com>
References: <1426548628-29644-1-git-send-email-jcmvbkbc@gmail.com>
 <1426548628-29644-2-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20150320234437.3c93faaf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Tue, 17 Mar 2015 02:30:27 +0300, Max Filippov wrote:
> There's no way to disable getsubopt in uClibc 0.9.33.2: either GNU or
> SUSv3 getsubopt is always built.
> 
> Properly exclude SUSv3 getsubopt implementation when GNU getopt is
> selected.
> Exclude GNU getsubopt when SUSv3 getopt is selected. Honor getopt_long
> configuration.
> 
> This brings UCLIBC_HAS_GNU_GETOPT, UCLIBC_HAS_GNU_GETSUBOPT and
> UCLIBC_HAS_GETOPT_LONG handling in sync with uClibc and uClibc-ng tips.
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Both patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

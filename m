From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Apr 2014 23:11:16 +0200
Subject: [Buildroot] [PATCH 1/1] Updated package download address. Added
 staging option so that applications that depend on rtai's headers may be
 built by buildroot. Re-directed the include dir to /usr/include/rtai.
In-Reply-To: <1392913567-4146-1-git-send-email-andy@outsideglobe.com>
References: <1392913567-4146-1-git-send-email-andy@outsideglobe.com>
Message-ID: <20140412231116.239a741b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andrew Barnes,

On Thu, 20 Feb 2014 16:26:07 +0000, Andrew Barnes wrote:
> Signed-off-by: Andrew Barnes <andy@outsideglobe.com>
> ---
>  package/rtai/rtai.mk | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)

Since you never came back with an updated patch (as far as I know), I
applied your patch after fixing the commit log.

A followup patch to bump RTAI to 4.0 would be very welcome, though.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2016 23:06:12 +0200
Subject: [Buildroot] [PATCH] gst1-plugins-bad: remove obsolete gettext
 patch
In-Reply-To: <1465893927-8430-1-git-send-email-marcin.nowakowski@imgtec.com>
References: <1465893927-8430-1-git-send-email-marcin.nowakowski@imgtec.com>
Message-ID: <20160615230612.5484d0c9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Jun 2016 10:45:27 +0200, Marcin Nowakowski wrote:
> The patch to update gettext version is unnecessary, as gettexttize is
> enabled and therefore an always up-to-date version is used.
> 
> Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
> ---
>  .../gst1-plugins-bad/0001-use-gettext-0.18.patch        | 17 -----------------
>  1 file changed, 17 deletions(-)
>  delete mode 100644 package/gstreamer1/gst1-plugins-bad/0001-use-gettext-0.18.patch

Following the discussion with Peter Korsgaard, I've marked your patch
as "Changes Requested" in our patch tracking system. This means that
your patch is no longer in our queue of "pending" patches. So don't
forget to send an updated version :-)

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

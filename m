From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Thu, 15 Apr 2010 21:49:04 +0300
Subject: [Buildroot] X11 fixes and cleanups
In-Reply-To: <1271264806-23336-1-git-send-email-will_wagner@carallon.com>
References: <1271264806-23336-1-git-send-email-will_wagner@carallon.com>
Message-ID: <4BC75FA0.4050303@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/14/2010 08:06 PM, Will Wagner wrote:
> This series of patches bumps the version of xserver and pixman, as well
> as removing packages removed from X11R7.5 and cleaning up the Config.in
> files
>
> Apologies for the incorrect patches sent earlier, this time I appear to
> have got it right.
>
> The patch series is also available via git at:
>
> git://gitorious.org/willw-buildroot/willw-buildroot.git x11r75patches

Since we sorted out that all packages were actually removed, but X11
documentation was not updated, all patches:

Acked-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>

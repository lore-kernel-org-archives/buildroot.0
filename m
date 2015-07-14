From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jul 2015 00:39:49 +0200
Subject: [Buildroot] [PATCH 1/2] pkg-download: add optional destination
 filename
In-Reply-To: <1429462679-4769-1-git-send-email-fhunleth@troodon-software.com>
References: <1429462679-4769-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20150715003949.7506a433@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Frank Hunleth,

On Sun, 19 Apr 2015 12:57:58 -0400, Frank Hunleth wrote:
> This adds an optional parameter to the DOWNLOAD macro so that it's
> possible to specify a destination filename that's different from one
> being downloaded.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  package/pkg-download.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

This patch is still pending in patchwork, but the discussion in PATCH
2/2 didn't really reached a conclusion other than the fact that you had
a very specific case of a patch being updated by upstream without being
renamed, and that you were going to talk with upstream about this. We
haven't heard from you about this specific problem since end of April,
and anyway the proposed implementation wasn't matching our requirements.

So I've marked this patch as Rejected in patchwork. Of course, if you
still have the issue, let's reopen the discussion and work on a proper
solution for the problem.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 22 Aug 2013 10:09:28 +0200
Subject: [Buildroot] [PATCH] apply-patches: run patch in batch mode
In-Reply-To: <1377150255-4940-1-git-send-email-arnout@mind.be>
References: <1377150255-4940-1-git-send-email-arnout@mind.be>
Message-ID: <5215C738.2070707@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle (Essensium/Mind) wrote:
> If the file to be patched is missing, then `patch' will interactively
> ask for a file to be patched. This is annoying in e.g. the autobuilders
> because they have to wait for a timeout instead of failing.
>
> Giving the '-t' (dry-run) option to patch fixes this: it will skip the

"dry-run"? Of course not. :)
s/dry-run/batch mode/

> missing file, and return a non-zero exit code. So the build cleanly
> fails.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

With that fixed:
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

Luca

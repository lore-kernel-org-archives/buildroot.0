From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 14 Oct 2013 22:26:15 +0200
Subject: [Buildroot] [PATCH 3/3] boost: fix build failures after version
 bump
In-Reply-To: <1381760111-1271-3-git-send-email-gustavo@zacarias.com.ar>
References: <1381760111-1271-1-git-send-email-gustavo@zacarias.com.ar>
 <1381760111-1271-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <525C5367.4040300@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

Gustavo Zacarias wrote:
> Fix build failures that happened after the version bump such as:
> http://autobuild.buildroot.net/results/570/570b091702763b29843d9207bc14dea67085fea0/
> http://autobuild.buildroot.net/results/c26/c26498f1a4e6bcbc3a2dfce6a51fa7d21b72f21f/
> and other failures by disabling the new (1.54+) coroutine and log
> libraries which weren't handled and hence enabled by default.
>
> These also made the target size bigger and build times longer
> unnecessarily.
>
> When/if they are needed for some future user this can be revisited and
> their proper conditions for enablement assesed.
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

This one bit me as well, thanks for the fix.

Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca

From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 20 Sep 2015 21:32:14 +0200
Subject: [Buildroot] [PATCH 14/19] package-cmake: remove now-redundant
 target ccache support
In-Reply-To: <1442777319-24164-1-git-send-email-arnout@mind.be>
References: <1442774504-22799-1-git-send-email-arnout@mind.be>
 <1442777319-24164-1-git-send-email-arnout@mind.be>
Message-ID: <55FF09BE.7030900@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20-09-15 21:28, Arnout Vandecappelle (Essensium/Mind) wrote:
> All the complexity with the different ways that CMAKE_C_COMPILER and
> CMAKE_C_COMPILER_ARG1 can be set are no longer needed, it's all handled
> by the toolchain wrapper now.
> 
> Note that it is still necessary to handle this for the host build.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 Hi all,

 Sorry for the weird numbering and threading. My send-email had been interrupted
halfway through, and I messed up the subsequent resends a little. But at least,
all the patches are theren.

 This particular one I've marked as Superseded in patchwork.

 Regards,
 Arnout

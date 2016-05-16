From: Martin Kelly <martin@surround.io>
Date: Mon, 16 May 2016 16:37:47 -0700
Subject: [Buildroot] [PATCH] Config.in: add -Og option
In-Reply-To: <06c3a186-7b7e-a66e-9a55-fe6afcaef10e@mind.be>
References: <1463183826-28562-1-git-send-email-martin@surround.io>
 <06c3a186-7b7e-a66e-9a55-fe6afcaef10e@mind.be>
Message-ID: <573A59CB.1030903@surround.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/14/2016 03:50 PM, Arnout Vandecappelle wrote:
>   Hi Martin,
>
>   In addition to Thomas's comments, I'd like to reword the help text a
> little.
>
>
>
>   The last sentence doesn't fit here. So:
>
>        Optimize for debugging. This enables optimizations that do not
>        interfere with debugging. It should be the optimisation level of
>        choice for the standard edit-compile-debug cycle, offering a
>        reasonable level of optimization while maintaining fast compilation
>        and a good debugging experience.
>

Your wording seems fine. Mine was just copied from the manpage :). I'll 
revise the patch to use that wording.

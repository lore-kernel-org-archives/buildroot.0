From: James Knight <james.d.knight@live.com>
Date: Tue, 27 Oct 2015 00:52:36 -0400
Subject: [Buildroot] [PATCH v2] Makefile: Remove 'quiet' variable
In-Reply-To: <1444334617-23796-1-git-send-email-cedric.marie@openmailbox.org>
References: <1444334617-23796-1-git-send-email-cedric.marie@openmailbox.org>
Message-ID: <CALAjcgXh8oXfHZYBx_q6Y1JvRKtWym=ifqfD5J2dD0SLrBRzrA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 8, 2015 at 4:03 PM, C?dric Marie
<cedric.marie@openmailbox.org> wrote:
> 'quiet' variable is set and exported, but it is not used. We can safely
> remove it.
>
> This variable is inherited from the Makefile of the Linux kernel, and
> is not used in Buildroot.
>
> In support/scripts/mkmakefile, 'quiet' value is checked, but the test
> is always true ('quiet' is never set to silent_), so the test can be
> removed as well.
>
> Signed-off-by: C?dric Marie <cedric.marie@openmailbox.org>

Reviewed-by: "James Knight" <james.d.knight@live.com>

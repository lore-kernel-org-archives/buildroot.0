From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jun 2020 16:29:24 +0200
Subject: [Buildroot] [PATCH] package/ktap: fix compilation with gcc >=
 8.x and newer kernel
In-Reply-To: <20200619124606.125213-1-ralphs@netwinder.org>
References: <20200619124606.125213-1-ralphs@netwinder.org>
Message-ID: <20200620162924.6b61ae33@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ralph,

On Fri, 19 Jun 2020 08:46:06 -0400
Ralph Siemsen <ralphs@netwinder.org> wrote:

> Package currently fails to build for multiple architectures.
> Can be fixed with two patches, taken from following github PR:
> https://github.com/ktap/ktap/pull/107

Thanks a lot for your contribution!

However, we cannot pull patches directly from Github: our past
experience has shown that the contents of the patches can change in
subtle ways (typically the Git commit SHA1 included in the patch can
change to no longer be ambiguous with new SHA1s being used for new
commits in the same repository).

Due to this, we prefer to have such patches directly in Buildroot. Each
patch will need to carry your Signed-off-by, plus a detail of where
they come from.

In addition, the overall Buildroot patch should also have your
Signed-off-by.

Could you adjust this and send a new iteration ?

That being said, is ktap still being maintained ? The last commit on
Github is from 2017, the ktap.org domain no longer exists, and the pull
request you're using here dates back from 2018 has still hasn't been
merged.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

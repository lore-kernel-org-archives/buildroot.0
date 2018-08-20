From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 20:21:13 +0200
Subject: [Buildroot] [PATCH 1/3] oracle-mysql: fix hostname path
In-Reply-To: <20180820111304.22933-2-chrismcc@gmail.com>
References: <20180820111304.22933-1-chrismcc@gmail.com>
 <20180820111304.22933-2-chrismcc@gmail.com>
Message-ID: <20180820202113.0a70c493@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christopher,

On Mon, 20 Aug 2018 04:13:02 -0700, Christopher McCrory wrote:
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>

An empty commit log for such a change is really not good. What is
broken ? How does this fix what was broken ?

In general, a good rule: if your commit log is empty, something is
wrong.

So for this time, I've added a commit log and applied your patch to
master, see at
https://git.buildroot.org/buildroot/commit/?id=0bf656ead9801552f939217c5cc019fa24583b90
what I added. For your next contributions, I will now expect a
non-empty commit log actually explaining what the issue was, and how
the patch solves it.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

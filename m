From: Christian Stewart <christian@paral.in>
Date: Fri, 01 Feb 2019 22:51:50 -0800
Subject: [Buildroot] [PATCH] package/docker-engine: drop unused _DAEMON
 option
In-Reply-To: <20190201220408.7421-1-peter@korsgaard.com>
References: <20190201220408.7421-1-peter@korsgaard.com>
Message-ID: <87h8dmadix.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Peter Korsgaard <peter@korsgaard.com> writes:
> Since commit de336584d2 (package/docker-engine: split docker-{cli, engine},
> bump to v18.09.0), the docker-engine package only builds the daemon part,
> and the .mk file no longer use the _DAEMON option, so drop it.

Thanks, not sure how I missed this in the original series.

LGTM.

Tested-by: Christian Stewart <christian@paral.in>

~ Christian

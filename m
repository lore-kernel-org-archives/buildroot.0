From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 10 Oct 2019 10:14:59 +0200
Subject: [Buildroot] [PATCH] utils/test-pkg: set the return code for fail
In-Reply-To: <20191010093955.491e55a7@windsurf>
References: <20191010063933.30858-1-heiko.thiery@gmail.com>
 <20191010093955.491e55a7@windsurf>
Message-ID: <CAEyMn7YW77RFZhMKgTim8wu=AOG4vXyjUvUgxY9N=Mwke9x0gg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Why should this be optional? It seems like test-pkg should always
> return a non-zero error code when the build or legal-info fails.

Just did not want to change the default behaviour. But if it is ok to
change the default I can remove the option.

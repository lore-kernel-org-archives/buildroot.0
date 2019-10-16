From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 21:33:38 +0200
Subject: [Buildroot] [PATCH] support/testing: improve commands on
 syslog-ng test
In-Reply-To: <20191016010950.19189-1-ricardo.martincoski@gmail.com>
References: <20191016010950.19189-1-ricardo.martincoski@gmail.com>
Message-ID: <20191016213338.0ece2f04@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 15 Oct 2019 22:09:50 -0300
Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:

> There is no need for double grep, so choose a better regexp.
> Use && instead of ; between commands so the sequence of commands fail
> faster.
> Break the last sequence of commands in 2 calls run() so the proper
> return code can be tested for each.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/322021813
> ---
>  support/testing/tests/package/test_syslog_ng.py | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

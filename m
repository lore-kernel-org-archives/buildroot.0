From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 20:58:55 +0200
Subject: [Buildroot] [PATCH 1/2] support/testing: add turbolua test
In-Reply-To: <20191002113513.3290960-1-m.niestroj@grinn-global.com>
References: <20191002113513.3290960-1-m.niestroj@grinn-global.com>
Message-ID: <20191002205855.222da497@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  2 Oct 2019 13:35:12 +0200
Marcin Niestroj <m.niestroj@grinn-global.com> wrote:

> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
>  .gitlab-ci.yml                                 |  1 +
>  support/testing/tests/package/test_turbolua.py | 13 +++++++++++++
>  2 files changed, 14 insertions(+)
>  create mode 100644 support/testing/tests/package/test_turbolua.py

Both applied to master, thanks. Could you send a follow-up patch that
adds a hash for the LICENSE file in the turbolua package ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

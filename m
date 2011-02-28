From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Mon, 28 Feb 2011 08:34:30 +0100
Subject: [Buildroot] [PATCH] gdb: depend on host-expat to fix remote
	debugging
In-Reply-To: <1298579868-22046-1-git-send-email-bjorn.forsman@gmail.com>
References: <1298579868-22046-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <AANLkTikyjYTzWTZJhHZfJr8eP1VHxe-mN9znaSFt-87P@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/2/24 Bj?rn Forsman <bjorn.forsman@gmail.com>:
> This patch fixes the following error when using GDB with gdbserver:
>
> ?warning: Can not parse XML target description; XML support was disabled at compile time
> ?Remote 'g' packet reply is too long: <very long line of hex chars>
> ?[remote debugging does not work]
>
> Use $(HOST_CONFIGURE_OPTS) so expat is found.
>
> Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
> ---
> ?toolchain/gdb/gdb.mk | ? ?3 ++-
> ?1 files changed, 2 insertions(+), 1 deletions(-)

Ping.

Please consider including this bug fix in the upcoming release.

Best regards,
Bj?rn Forsman

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 22:30:06 +0200
Subject: [Buildroot] [PATCH] package/libssh: add patch to fix regression
In-Reply-To: <20200421084650.11391-1-heiko.thiery@gmail.com>
References: <20200421084650.11391-1-heiko.thiery@gmail.com>
Message-ID: <20200421223006.1f7eab3b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 21 Apr 2020 10:46:51 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> The libssh server is used by libnetconf2. With libssh version 0.9.4 a
> regression was introduced that wrongly leads to session closed after the
> poll timeout.
> 
> The patch comes from upstrem:
> https://git.libssh.org/projects/libssh.git/commit/?id=6417f5a3cac8537ac6f6ff7fc1642dfaa0917fb4
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  ...eturning-SSH_AGAIN-from-ssh_channel_.patch | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/libssh/0002-channels-Avoid-returning-SSH_AGAIN-from-ssh_channel_.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

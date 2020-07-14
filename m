From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 10:12:38 +0200
Subject: [Buildroot] [PATCH 1/1] Makefile: add /etc/bash_completion.d to
 non-bash purge
In-Reply-To: <20200714022459.1926-1-danomimanchego123@gmail.com>
References: <20200714022459.1926-1-danomimanchego123@gmail.com>
Message-ID: <20200714101238.36f600e4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Jul 2020 22:24:59 -0400
Danomi Manchego <danomimanchego123@gmail.com> wrote:

> Currently, we delete /usr/share/bash-completion when bash is not enabled.
> We need to delete /etc/bash_completion.d too. For example, the jo package
> installs files there:
> 
> /etc/bash_completion.d/jo.bash
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

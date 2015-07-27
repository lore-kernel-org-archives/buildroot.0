From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 22:55:08 +0200
Subject: [Buildroot] [PATCH 1/2] xterm: x-includes and x-libraries must
 be set for cross-compiling
In-Reply-To: <1438008410-1465-1-git-send-email-bas@bmail.ru>
References: <1438008410-1465-1-git-send-email-bas@bmail.ru>
Message-ID: <20150727225508.5d2ac4ba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mikhail Peselnik,

On Mon, 27 Jul 2015 17:46:49 +0300, Mikhail Peselnik wrote:
> These flags need to be set so that the configure script would
> correctly use libICE from cross-toolchain rather than from host.
> 
> This fix is similar to "package/efl/libevas: x-includes and x-libraries
> must be set for cross-compiling" done by Romain Naour on libecore.
> 
> Signed-off-by: Mikhail Peselnik <bas@bmail.ru>
> ---
>  package/xterm/xterm.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Both patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Feb 2017 16:44:53 +0100
Subject: [Buildroot] [PATCH v2 2/2] toolchain-external: install
 libanl.so for glibc
In-Reply-To: <1487926988-32495-2-git-send-email-jbb@gamblify.com>
References: <1487848270-32609-1-git-send-email-jbb@gamblify.com>
 <1487926988-32495-1-git-send-email-jbb@gamblify.com>
 <1487926988-32495-2-git-send-email-jbb@gamblify.com>
Message-ID: <20170225164453.5e8d6ad3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Feb 2017 10:03:08 +0100, Jesper B?kdahl wrote:
> libanl.so is needed for asynchronous network address and service
> translation, declared in netdb.h
> 
> Signed-off-by: Jesper B?kdahl <jbb@gamblify.com>
> ---
>  toolchain/toolchain-external/pkg-toolchain-external.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

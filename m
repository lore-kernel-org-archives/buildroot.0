From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 22:39:46 +0200
Subject: [Buildroot] [PATCH v2 1/6] testing/infra/emulator: allow to
 specify pexpect timeout
In-Reply-To: <20170712024009.2366-2-andrew.smirnov@gmail.com>
References: <20170712024009.2366-1-andrew.smirnov@gmail.com>
 <20170712024009.2366-2-andrew.smirnov@gmail.com>
Message-ID: <20170722223946.30381a2a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Jul 2017 19:40:04 -0700, Andrey Smirnov wrote:
> Some commands take more than 5 seconds to complete under QEMU, so add
> provisions to allow individual unit-test to specify different duration
> to avoid false negative test failures.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  support/testing/infra/emulator.py | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

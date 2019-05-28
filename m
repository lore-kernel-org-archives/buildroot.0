From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 May 2019 08:55:20 +0200
Subject: [Buildroot] [PATCH V2 8/9] support/config.sub: Add C-SKY support
In-Reply-To: <87muj77e2k.fsf@dell.be.48ers.dk>
References: <1557305915-11247-1-git-send-email-guoren@kernel.org>
 <1557305915-11247-8-git-send-email-guoren@kernel.org>
 <20190527223022.1d1aaa5a@windsurf>
 <87muj77e2k.fsf@dell.be.48ers.dk>
Message-ID: <20190528085520.017b3f84@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 May 2019 00:00:35 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> I agree that this minimal change is probably the most sensible thing to
> do for master, but for next it IMHO makes more sense to update our
> config.sub / config.guess copies, as upstream has gained csky support
> since:
> 
> commit 63b4ce2e8c28aee6a32133e400436e4ca885215a
> Author: Mao Han <han_mao@c-sky.com>
> Date:   Mon Apr 16 14:46:36 2018 +1000
> 
>            * config.sub (csky, csky-*): Recognise.
>            * testsuite/config-sub.data: Add a test case.
> 
>    Signed-off-by: Ben Elliston <bje@gnu.org>

Agreed. I hadn't checked upstream gnuconfig, but it indeed makes a lot
of sense to update our gnuconfig copy using the latest upstream version.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

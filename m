From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Feb 2016 22:16:20 +0100
Subject: [Buildroot] [PATCH v10] board: add support for ARM Juno r0 and
 r1 Development Boards
In-Reply-To: <22430f77fc25276d94fcc16a6b282f2a8a960b47.1454587291.git.jpinto@synopsys.com>
References: <22430f77fc25276d94fcc16a6b282f2a8a960b47.1454587291.git.jpinto@synopsys.com>
Message-ID: <20160204221620.56e0088d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Joao Pinto,

On Thu,  4 Feb 2016 17:17:35 +0000, Joao Pinto wrote:
> The Juno ARM Development Platform (ADP) is a software development
> platform for ARMv8-A, it includes the Juno Versatile Express board 
> and an ARMv8-A reference software port available through Linaro.
> 
> Signed-off-by: Joao Pinto <jpinto@synopsys.com>

I've applied your patch, but there was still one thing that was wrong:
the author information did not contain your full name, but only
"jpinto". See the patch on patchwork:

  http://patchwork.ozlabs.org/patch/579041/

(the line Submitter)

Though I'm not entirely sure why it is this way, since your From:
really contains your complete name.

Anyway, I've fixed that up before applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

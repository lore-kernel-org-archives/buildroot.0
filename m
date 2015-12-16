From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2015 21:22:53 +0100
Subject: [Buildroot] [PATCH v7] board: add support for ARM Juno
 Development Board
In-Reply-To: <b132a8d9bc9e51f56f7b4a5c0e4c02404aaabd8a.1444647414.git.jpinto@synopsys.com>
References: <b132a8d9bc9e51f56f7b4a5c0e4c02404aaabd8a.1444647414.git.jpinto@synopsys.com>
Message-ID: <20151216212253.7b5e731e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joao,

On Wed, 16 Dec 2015 15:22:24 +0000, Joao Pinto wrote:
> The Juno ARM Development Platform (ADP) is a software development
> platform for ARMv8-A, it includes the Juno Versatile Express board 
> and an ARMv8-A reference software port available through Linaro.
> 
> Signed-off-by: Joao Pinto <jpinto@synopsys.com>

There is something weird with your posting: this PATCH v7 e-mail has
the exact same Message-Id as your PATCH v5 (for the same topic). This
breaks threading.

Did you do something special to re-use the same Message-Id ?

If your intent was to make this PATCH v7 e-mail appear as a reply to
the PATCH v5 one, you should have used git send-e-amil
--in-reply-to=<message-id-of-PATCHv5>.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

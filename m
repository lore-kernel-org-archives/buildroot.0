From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Jul 2013 09:48:47 +0200
Subject: [Buildroot] [PATCHv2 09/25] toolchain/helpers: only check for
 an EABI toolchain
In-Reply-To: <87mwpoc27c.fsf@dell.be.48ers.dk>
References: <1373754468-7527-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1373754468-7527-10-git-send-email-thomas.petazzoni@free-electrons.com>
 <87mwpoc27c.fsf@dell.be.48ers.dk>
Message-ID: <20130715094847.6b365266@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 14 Jul 2013 22:32:23 +0200, Peter Korsgaard wrote:

>  Thomas> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  Thomas> ... since we only support EABI now.
> 
>  Thomas> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  Thomas> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> This arguably should have been together with patch 6, but ok -
> Committed, thanks.

Yes, Yann's patches were heavily split in fine-grained commits. For two
of them, I did a squash because it was really the same thing, but for
the others, I kept as Yann did.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

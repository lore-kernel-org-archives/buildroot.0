From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Nov 2014 22:00:37 +0100
Subject: [Buildroot] [PATCH] package/qemu: add support for FDT
In-Reply-To: <1416259540-25482-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Mon, 17 Nov 2014 22:25:40 +0100")
References: <1416259540-25482-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <878uj8p6kq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > FDT is the Flat Device Tree, and allows QEMU to pass DTs to the VMs.
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 > ---
 > Although this looks like a feature patch, it does fix quite a number
 > of autobuild failures, so I think it is still worth going in for the
 > release.

 > It was due to my testing my full series, so I did not notice that
 > newer versions of Qemu needed FDT support for some of its system
 > emulations.

Committed with autobuilder references added, thanks.

-- 
Bye, Peter Korsgaard

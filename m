From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jun 2014 19:25:00 +0200
Subject: [Buildroot] [PATCH 2/2] Makefile: test if "dot" exists in
 "<pkg>-graph-depends"
In-Reply-To: <1402997634-2783-2-git-send-email-fabio.porcedda@gmail.com>
References: <1402997634-2783-1-git-send-email-fabio.porcedda@gmail.com>
 <1402997634-2783-2-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20140622192500.469fe316@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Tue, 17 Jun 2014 11:33:54 +0200, Fabio Porcedda wrote:
> To be able to check the "dot" command availability in
> "<pkg>-graph-depends" move the check to the "graph-depends-requirements" rule.
> Also don't use a subshell for the exit command to be sure that the error
> will be returned by the shell.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

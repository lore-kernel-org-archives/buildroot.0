From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Sep 2012 10:07:38 +0200
Subject: [Buildroot] [PATCH RESEND] external-toolchain: add Sourcery
 CodeBench ARM 2012.03
In-Reply-To: <87a9w860tj.fsf@macbook.be.48ers.dk>
References: <1347271377-7685-1-git-send-email-fabio.porcedda@gmail.com>
 <87a9w860tj.fsf@macbook.be.48ers.dk>
Message-ID: <20120930100738.21106455@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Sat, 29 Sep 2012 22:17:28 +0200, Peter Korsgaard wrote:
> >>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:
> 
>  Fabio> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> 
> Committed, thanks.

Isn't this toolchain causing a problem with RPC support, since it has
glibc 2.15 ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

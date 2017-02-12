From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Feb 2017 18:22:46 +0100
Subject: [Buildroot] [PATCH v2] infra/ccache: avoid color diagnostics
 with GCC older than v4.9
In-Reply-To: <609383214.9983962.1486911337173.JavaMail.zimbra@datacom.ind.br>
References: <1486733648-14658-1-git-send-email-casantos@datacom.ind.br>
 <1486899181-8210-1-git-send-email-casantos@datacom.ind.br>
 <20170212141425.GE11105@free.fr>
 <609383214.9983962.1486911337173.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20170212182246.0b40c952@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Feb 2017 12:55:37 -0200 (BRST), Carlos Santos wrote:

> > Can you provide a reliable way to reproduce the issue, please?  
> 
> What does "echo $GCC_COLORS" say?

thomas at skate:~$ echo $GCC_COLORS

thomas at skate:~$

So the issue only arise when GCC_COLORS is defined non-empty in the
user's environment?

> And remember that you must not redirect the output to a file or pipe.

I just ran "make" without redirecting the output to a file or pipe.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

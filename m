From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Feb 2015 22:37:14 +0100
Subject: [Buildroot] [PATCHv3 0/5] Graph about installed size per package
In-Reply-To: <1423171200-24583-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1423171200-24583-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150205223714.4bde9ee6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  5 Feb 2015 22:19:55 +0100, Thomas Petazzoni wrote:

> Thomas Petazzoni (5):
>   Makefile: remove the graphs/ dir on 'make clean'
>   pkg-generic: add step_pkg_size global instrumentation hook
>   support/scripts: add size-stats script
>   Makefile: implement a size-stats target
>   Dummy testing packages

Oops, this last patch shouldn't have been sent. Fortunately, since it
is huge, it hasn't passed the filter of the list.

Peter, just reject this mail from me, as it doesn't make sense. The
series is really only the first four patches.

Sorry for the mess,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 17:43:43 +0200
Subject: [Buildroot] [PATCH] package/qpid-proton: needs host-python2
In-Reply-To: <20150714120325.GB2332@tarshish>
References: <1436873894-1080-1-git-send-email-yann.morin.1998@free.fr>
 <20150714114803.GA2332@tarshish>
 <20150714135627.26cf899a@free-electrons.com>
 <20150714120325.GB2332@tarshish>
Message-ID: <20150714174343.398e8385@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue, 14 Jul 2015 15:03:25 +0300, Baruch Siach wrote:

> Related to this, what do you thing about changing the host python requirement 
> in the manual?

Yes, sounds good. Samuel is using Buildroot with both Python 2 and
Python 3 installed on his machine, but Python 3 being the default one.
However, I don't know if anyone has tested with a pure Python 3
installation. But it _should_ work. If not that's a bug that we should
fix.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

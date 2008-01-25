From: Thomas Lundquist <lists@zelow.no>
Date: Fri, 25 Jan 2008 11:18:24 +0100
Subject: [Buildroot] Resolving Qtopia4 and -qt-mouse-tslib
In-Reply-To: <1ec1a3270801242109x4533bc4dr6a7bf1077f90f3cd@mail.gmail.com>
References: <1ec1a3270801242109x4533bc4dr6a7bf1077f90f3cd@mail.gmail.com>
Message-ID: <20080125101824.GB30836@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 25, 2008 at 01:09:28PM +0800, Fredy Yanardi wrote:
> 
> When configuring Qt with bad configure-flags that doesn't exists will
> give false configure error.
> Example:
> 
> configure -no-sql-foobar -qt-mouse-tslib
> will give:
> -qt-mouse-tslib: unknown argument
> when it is -no-sql-foobar which is unknown.

Did a manual patching, test now please.

r20900 


Thomas.

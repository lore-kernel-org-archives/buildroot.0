From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Jun 2014 18:18:41 +0200
Subject: [Buildroot] problems with make graph-build on x86_64
In-Reply-To: <CAE9DZUSiaY35a4xLcMA2f=4ERrxuR7Kt2xhOFs9J0tvWh-4+Rg@mail.gmail.com>
References: <CAE9DZURkabAJ50=Upw9vuzDFsRnMLRoKBuKGLm_=V4Fn+4f-bw@mail.gmail.com>
 <20140612173557.3788d08d@free-electrons.com>
 <CAE9DZUSiaY35a4xLcMA2f=4ERrxuR7Kt2xhOFs9J0tvWh-4+Rg@mail.gmail.com>
Message-ID: <20140612181841.7ff4a2f6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Dallas Clement,

On Thu, 12 Jun 2014 10:48:37 -0500, Dallas Clement wrote:

> > What version of matplotlib do you have?
> 
> python-matplotlib.x86_64        0.99.1.2-1.el6
> @anaconda-RedHatEnterpriseLinux-201301301459.x86_64/6.4
> python-matplotlib-tk.x86_64     0.99.1.2-1.el6
> rhel-6-server-optional-rpms

Might be a too old version. I would suggest you to create a simple
example of a matplotlib application on this system, and see if you're
able to generate a PDF/PNG graph. If yes, give us your source code so
that we can compare with the more recent versions of matplotlib and see
if a backward compatible solution is possible.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 20:25:07 +0100
Subject: [Buildroot] Illegal instruction by python's xmlrpclib on
 powerpc64, gcc-4.9
In-Reply-To: <56390904.7010101@zacarias.com.ar>
References: <CAM+bi4sfbXMkgow7-ku+u2f5ypEM1WGPAuRRvkkjUA-Z05KnqQ@mail.gmail.com>
 <20151103151730.1e9dcc3c@free-electrons.com>
 <56390904.7010101@zacarias.com.ar>
Message-ID: <20151103202507.7883b141@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, Dwayne,

On Tue, 3 Nov 2015 16:20:36 -0300, Gustavo Zacarias wrote:

> I've added e5500/e6500 support with basic testing from Dwayne Fontenot, 
> i never had any e5500/6500 hardware in my hands to test though, so it's 
> kind of YMMV/best spare effort.

All right, so I'm adding Dwayne in Cc: to this e-mail so hopefully he
can help us by doing testing on real hardware.

Dwayne, can you have a look at the report at
http://lists.busybox.net/pipermail/buildroot/2015-November/143655.html
and see if you can reproduce or not on a PowerPC e6500 platform ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

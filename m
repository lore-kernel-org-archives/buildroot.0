From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 23:05:30 +0200
Subject: [Buildroot] [PATCH 05/14] package/mesa3d: DRI drivers depend on
 X.org
In-Reply-To: <d136fff0309f466027a1089f5eeae6f0acd18e2b.1397750571.git.yann.morin.1998@free.fr>
References: <cover.1397750571.git.yann.morin.1998@free.fr>
 <d136fff0309f466027a1089f5eeae6f0acd18e2b.1397750571.git.yann.morin.1998@free.fr>
Message-ID: <20140417230530.5168bb83@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 17 Apr 2014 18:04:17 +0200, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> It does not make sense to build DRI drivers without X.org.

Indeed. Could you summarize which DRI drivers and which Gallium drivers
are currently available in Mesa3D ? And also, how Gallium drivers are
used: can they be used with X.org ? Only with an EGL implementation ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

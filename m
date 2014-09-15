From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Sep 2014 15:59:34 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <CA+-urNSSKAn3=oXPM2553CO6+8XQB=4hKjzNR4mSg61aAY_LgQ@mail.gmail.com>
References: <20140914063013.2E5D2100F07@stock.ovh.net>
 <20140914121904.0c2ebcbd@free-electrons.com>
 <CA+-urNSSKAn3=oXPM2553CO6+8XQB=4hKjzNR4mSg61aAY_LgQ@mail.gmail.com>
Message-ID: <20140915155934.7df3f86d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Frank Hunleth,

Please don't reply to me directly, keep the list in Cc. Thanks!

On Mon, 15 Sep 2014 09:49:20 -0400, Frank Hunleth wrote:

> > compiling qwt_plot_glcanvas.cpp
> > In file included from qwt_plot_glcanvas.cpp:10:0:
> > qwt_plot_glcanvas.h:15:17: fatal error: qgl.h: No such file or directory
> > compilation terminated.
> >
> > Frank, you updated qwt recently. Could you have a look at this issue?
> 
> I'll check this out later today or tomorrow. I have an idea on the issue.

Note that the issue has already been fixed by Peter, see
http://git.buildroot.net/buildroot/commit/?id=6de4afc3b4353327eb5a2dc57b9f449a4d14a969.
Of course, you're welcome to check Peter's patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

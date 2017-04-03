From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Apr 2017 22:46:59 +0200
Subject: [Buildroot] [PATCH v2] libepoxy: OpenGL EGL and OpenGL ES
 dependencies are mandatory
In-Reply-To: <a18b94fc97da118b9e5232569b5e09ae@zacarias.com.ar>
References: <20170322115643.48653-1-Vincent.Riera@imgtec.com>
 <20170322225648.5a32abeb@free-electrons.com>
 <ea393b5769dccf6047c895588cab7298@zacarias.com.ar>
 <20170323142827.2dc1af5e@free-electrons.com>
 <a18b94fc97da118b9e5232569b5e09ae@zacarias.com.ar>
Message-ID: <20170403224659.29408234@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Mar 2017 10:31:58 -0300, Gustavo Zacarias wrote:

> Hi Thomas.
> The patch is mixing two different "issues":
> 1) It "fixes" that EGL support, without GLX, requires GLES, which isn't 
> true.
> 2) It fixes the autobuilder failures that GLX requires EGL - which 
> wasn't the case before (1.3.x versions). I need to consult upstream 
> about this, my guess is that it's probably wrong since EGL isn't a hard 
> requirement for GLX - GLX existed long before EGL did.

Has upstream spoken about this?

The build issue has been there for a long time, so I would really like
to see it fixed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

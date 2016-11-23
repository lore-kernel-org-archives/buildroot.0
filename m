From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 21:56:57 +0100
Subject: [Buildroot] [PATCH next 4/6] moarvm: select libffi when
 building for MIPS
In-Reply-To: <20161123143914.3969-4-Vincent.Riera@imgtec.com>
References: <20161123143914.3969-1-Vincent.Riera@imgtec.com>
 <20161123143914.3969-4-Vincent.Riera@imgtec.com>
Message-ID: <20161123215657.5ac2436d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Nov 2016 14:39:12 +0000, Vicente Olivert Riera wrote:
> Otherwise the compilation will fail like this:
> 
> ./libmoar.so: undefined reference to `dcCallbackThunkEntry'
> 
> See: https://github.com/MoarVM/MoarVM/issues/222
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Is this something we can see in the autobuilders? I.e, is this master
or next material?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 May 2017 16:50:03 +0200
Subject: [Buildroot] [PATCH next 1/2] mesa3d: bump version to 17.1.1
In-Reply-To: <6aslvdxn3j.ln2@ID-313208.user.individual.net>
References: <20170526131607.34436-1-Vincent.Riera@imgtec.com>
 <6aslvdxn3j.ln2@ID-313208.user.individual.net>
Message-ID: <20170527165003.4aa52137@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 26 May 2017 16:56:38 +0200, Bernd Kuhls wrote:

> the Vulkan Intel driver does not depend on the i965 dri driver anymore:
> 
> https://cgit.freedesktop.org/mesa/mesa/commit/configure.ac?
> h=17.1&id=9aebdb5d082ec640fe8a14704201952bddb50a88
> 
> So please add this change as well: https://github.com/bkuhls/buildroot/
> commit/8e880784e52728e6f6bc066d8a2dae5408b593d5#diff-30324b744ed4e90dac736d90b54ad0dfL156

OK, I'll wait for a v2 from Vicente. In the mean time, I've marked
both patches as Changes Requested.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

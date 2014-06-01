From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Jun 2014 13:04:19 +0200
Subject: [Buildroot] [PATCH v4 04/11] rpi-userland: cleanup *_CONF_OPT
In-Reply-To: <1401614673-3703-5-git-send-email-s.martin49@gmail.com>
References: <1401614673-3703-1-git-send-email-s.martin49@gmail.com>
 <1401614673-3703-5-git-send-email-s.martin49@gmail.com>
Message-ID: <20140601130419.58ed869e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun,  1 Jun 2014 11:24:26 +0200, Samuel Martin wrote:
> rpi-userland does not need -DBUILD_SHARED_LIBS=OFF to be passed to
> correclty build its static libraries; so remove this cmake flag from the
> configure options.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

As discussed in real-life, this should probably be squashed with PATCH
05/11, and with an expanded explanation that details why reverting
5e3b1f31b3f82e3b163567f10d7131c9d649a2cf does not re-introduce the bug
that 5e3b1f31b3f82e3b163567f10d7131c9d649a2cf was fixing.

Maybe you should submit these fixes separately, since they are not
related to the CMake package infrastructure per se?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 18:52:22 +0100
Subject: [Buildroot] [PATCH 2/4 v2] package/cmake: only build what is
 necessary
In-Reply-To: <1425808043-32292-3-git-send-email-s.martin49@gmail.com>
References: <1425808043-32292-1-git-send-email-s.martin49@gmail.com>
 <1425808043-32292-3-git-send-email-s.martin49@gmail.com>
Message-ID: <20150315185222.5850b048@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun,  8 Mar 2015 10:47:21 +0100, Samuel Martin wrote:
> Add a patch allowing to select the binaries to be built.
> 
> After applying this change, the time to build host-cmake is roughly
> 25% shorter.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Reviewed-by: Romain Naour <romain.naour@openwide.fr>
> Tested-by: Romain Naour <romain.naour@openwide.fr>

To be honest, I am not sure if we should apply such a large patch just
for the sake of build speed. Can you submit the patch upstream and see
what they think about it? If it gets merged upstream, then we have a
better case for backporting it until upstream makes a new release.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

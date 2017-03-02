From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 16:37:12 +0100
Subject: [Buildroot] [PATCH next] nano: bump to version 2.7.5
In-Reply-To: <20170223235851.15625-1-gustavo@zacarias.com.ar>
References: <20170223235851.15625-1-gustavo@zacarias.com.ar>
Message-ID: <20170302163712.1934b1e3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Feb 2017 20:58:51 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/nano/nano.hash | 2 +-
>  package/nano/nano.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

This seems to break the build of nano:

  http://autobuild.buildroot.net/results/db9/db9a48e6ed828e5a4464623419d25200b31890c3/build-end.log

Could you have a look?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

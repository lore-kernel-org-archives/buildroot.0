From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Thu, 26 Mar 2015 19:46:51 -0500
Subject: [Buildroot] [PATCH v9] package/sysdig: New package
In-Reply-To: <CA+TH9Vn6t-bT78+Z8iGFq7X3ftnbZqk0-mzoQJgVODDLpQmG-Q@mail.gmail.com>
References: <1427356117-27840-1-git-send-email-angelo.compagnucci@gmail.com>
 <CAMQcK5KZ89uEWt_9BqZ=Cdo2JXHfzKsMaaSAZoN71bdkEvNi9Q@mail.gmail.com>
 <CA+TH9Vn6t-bT78+Z8iGFq7X3ftnbZqk0-mzoQJgVODDLpQmG-Q@mail.gmail.com>
Message-ID: <CAMQcK5KVoXokrFxJUT0wogWZFwOXtoNT3c+sWS2nPKQzrM04DA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 26, 2015 at 3:37 PM, Angelo Compagnucci
<angelo.compagnucci@gmail.com> wrote:
> Dear Ryan Barnett,
>
> Are you sure? IMO, If the patch changes it should be reviewed again.

You do bring up a good point. However, I was basing this on what Yann
did with his hash improvement series:

http://patchwork.ozlabs.org/patch/453147/

> Good catch, but the message should be viewed only on supported arhcs,
> so it should be:
>
>  comment "sysdig needs a toolchain w/ C++ and a Linux kernel to be built"
>          depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP
>          depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS

Yes I agree with this.

Thanks,
-Ryan

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com

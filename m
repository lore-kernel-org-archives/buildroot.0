From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 23 Dec 2017 19:22:43 +0100
Subject: [Buildroot] [PATCH] package/libcue: is not parallel-safe
In-Reply-To: <874lojyvco.fsf@dell.be.48ers.dk>
References: <20171221164817.32302-1-romain.naour@gmail.com>
 <874lojyvco.fsf@dell.be.48ers.dk>
Message-ID: <cdba9fdd-e573-f990-9a5e-4d64f314b957@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Le 22/12/2017 ? 10:17, Peter Korsgaard a ?crit?:
>>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:
> 
>  > The last commit before the 1.4.0 release was to disable parallel build [1]
>  > [1] https://github.com/lipnitsk/libcue/commit/bebbc18a8c00a0b8c26bc6191af68c6a83629b40
> 
>  > Fixes:
>  > http://autobuild.buildroot.net/results/f25/f256037ca3d49f96add8ca2e2f9c980f5f9d764e
>  > http://autobuild.buildroot.net/results/d84/d84c7d0cb9cf5fa9996c42149eda5295700516f5
> 
>  > Signed-off-by: Romain Naour <romain.naour@gmail.com>
> 
> Committed, thanks.
> 

This patch needs to be backported to 2017.08 and 2017.02 branches.

http://autobuild.buildroot.net/results/51d/51d585cbf387fb514d04304aa0ea38324a02362e/build-end.log

Best regards,
Romain

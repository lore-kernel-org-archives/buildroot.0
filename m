From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Dec 2018 10:44:44 +0100
Subject: [Buildroot] [PATCH] package/docker-containerd: add missing
 dependency on host-pkgconf
In-Reply-To: <CA+h8R2q+H=kpewLO2q2zbxMWGJ8AaznRVd4xnn-jXbjf-q9jQw@mail.gmail.com>
References: <20181228150740.29890-1-thomas.petazzoni@bootlin.com>
 <CA+h8R2q+H=kpewLO2q2zbxMWGJ8AaznRVd4xnn-jXbjf-q9jQw@mail.gmail.com>
Message-ID: <20181229104444.432615e2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Dec 2018 20:46:50 -0800, Christian Stewart wrote:

> On Fri, Dec 28, 2018 at 7:07 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> > When libsseccomp support is enabled, docker-containerd uses pkg-config
> > to find libsseccomp, so we must depend on host-pkconf.
> > +DOCKER_CONTAINERD_DEPENDENCIES += libseccomp host-pkgconf  
> 
> LGTM.

Thanks for the review.

> Signed-off-by: Christian Stewart <christian@paral.in>
> 
> - I hope signed-off-by is appropriate here.

Signed-off-by is when you're the author, or in the chain of
developers/maintainers that carry the patch all the way to upstream.

In this case, what you should ideally have used is a Acked-by or
Reviewed-by. See also
https://buildroot.org/downloads/manual/manual.html#_reviewing_and_testing_patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

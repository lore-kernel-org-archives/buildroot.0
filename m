From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Dec 2018 11:29:41 +0100
Subject: [Buildroot] [PATCH] package/docker-containerd: add missing
 dependency on host-pkgconf
In-Reply-To: <CA+h8R2q+H=kpewLO2q2zbxMWGJ8AaznRVd4xnn-jXbjf-q9jQw@mail.gmail.com>
References: <20181228150740.29890-1-thomas.petazzoni@bootlin.com>
 <CA+h8R2q+H=kpewLO2q2zbxMWGJ8AaznRVd4xnn-jXbjf-q9jQw@mail.gmail.com>
Message-ID: <20181229102941.GY14286@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian, All,

On 2018-12-28 20:46 -0800, Christian Stewart spake thusly:
> On Fri, Dec 28, 2018 at 7:07 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> > When libsseccomp support is enabled, docker-containerd uses pkg-config
> > to find libsseccomp, so we must depend on host-pkconf.
> > +DOCKER_CONTAINERD_DEPENDENCIES += libseccomp host-pkgconf
> 
> LGTM.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> 
> - I hope signed-off-by is appropriate here.

No, it's not. A SoB line means that you were part of the chain that got
a patch to the list (and eventuakky, the repository), i.e. the author of
the patch, or any one taking it from the author up until it's comitted.

Here, you're saying that you looked at the patch, and that it looks OK
to you. This is a review, and is denoted by a Reviewed-by tag.

See the manual for more tags:
    https://buildroot.org/downloads/manual/manual.html#_reviewing_and_testing_patches

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

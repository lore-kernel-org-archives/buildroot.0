From: Christian Stewart <christian@paral.in>
Date: Fri, 28 Dec 2018 20:46:50 -0800
Subject: [Buildroot] [PATCH] package/docker-containerd: add missing
 dependency on host-pkgconf
In-Reply-To: <20181228150740.29890-1-thomas.petazzoni@bootlin.com>
References: <20181228150740.29890-1-thomas.petazzoni@bootlin.com>
Message-ID: <CA+h8R2q+H=kpewLO2q2zbxMWGJ8AaznRVd4xnn-jXbjf-q9jQw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Dec 28, 2018 at 7:07 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> When libsseccomp support is enabled, docker-containerd uses pkg-config
> to find libsseccomp, so we must depend on host-pkconf.
> +DOCKER_CONTAINERD_DEPENDENCIES += libseccomp host-pkgconf

LGTM.

Signed-off-by: Christian Stewart <christian@paral.in>

- I hope signed-off-by is appropriate here.

Best,
Christian

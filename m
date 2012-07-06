From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri, 06 Jul 2012 09:30:33 +0200
Subject: [Buildroot] [pull request v3] Pull request for branch
	for-2012.08/systemd
In-Reply-To: <cover.1340009350.git.maxime.ripard@free-electrons.com>
References: <cover.1340009350.git.maxime.ripard@free-electrons.com>
Message-ID: <4FF69419.1060006@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Do you intend at some point to take these patches ?

You *never* replied to any of these two patches, even though they both
have been floating around for more than half a year now, and this is
beginning to be quite frustrating.

Don't get me wrong, I'm not pushing them, I just want you to at least
acknowledge the existence of these patches and say if you are willing to
accept them or not.

Thanks,
Maxime

Le 18/06/2012 10:50, Maxime Ripard a ?crit :
> The following changes since commit 929c3e89a6715ecfdc8055ec82025cee5e8e23a1:
> 
>   libfreefare: add missing openssl dependency (2012-06-17 12:19:02 +0200)
> 
> are available in the git repository at:
> 
>   http://git.free-electrons.com/users/maxime-ripard/buildroot for-2012.08/systemd
> 
> for you to fetch changes up to 04cbd51ebed54c86ccf8fc03a3fc2eed1383893b:
> 
>   Add systemd unit for lighttpd (2012-06-18 10:40:29 +0200)
> 
> ----------------------------------------------------------------
> Maxime Ripard (2):
>       Rework of the init system
>       Add systemd unit for lighttpd
> 
>  package/busybox/busybox.mk        |    7 +++++++
>  package/lighttpd/lighttpd.mk      |   11 +++++++++++
>  package/lighttpd/lighttpd.service |   10 ++++++++++
>  package/pkg-gentargets.mk         |    8 ++++++++
>  target/generic/Config.in          |   25 +++++++++++++++++++++++++
>  5 files changed, 61 insertions(+)
>  create mode 100644 package/lighttpd/lighttpd.service
> 
> Thanks,
> 


-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

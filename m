From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Oct 2012 18:56:10 +0200
Subject: [Buildroot] [git commit] package: add gnupg
In-Reply-To: <20121015082204.6813A99871@busybox.osuosl.org>
References: <20121015082204.6813A99871@busybox.osuosl.org>
Message-ID: <20121016185610.36a03eff@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Mon, 15 Oct 2012 10:20:59 +0200, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=260a5820180760d4b00e530041d98eab4bab60fc
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
>  package/Config.in       |    1 +
>  package/gnupg/Config.in |   35 ++++++++++++++++++++++++++++++++++
>  package/gnupg/gnupg.mk  |   48 +++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 84 insertions(+), 0 deletions(-)

This is causing the following build breakage on various platforms:

  http://autobuild.buildroot.org/results/07f97705dda6dfbeab8ce95d6cef5b016329c9ce/build-end.log

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

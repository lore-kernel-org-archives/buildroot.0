From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 13 Sep 2013 18:10:17 +0200
Subject: [Buildroot] [RFCv1 02/11] toolchain-crosstool-ng: remove support
In-Reply-To: <1378416469-17708-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378416469-17708-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <523338E9.4090406@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> In order to avoid the work of converting the toolchain-crosstool-ng
> logic to the package infrastructure, we remove it from Buildroot,
> since it has been deprecated since quite some time.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> If we consider it too early to get rid of the Crosstool-NG backend
> entirely, then it can of course be converted to the package
> infrastructure, with quite a bit of effort (which we wanted to avoid
> for now).

I have nothing against the removal of crosstool-NG.

I'm happy with using ct-NG to build a toolchain and use it inBR as an
external toolchain.

Luca

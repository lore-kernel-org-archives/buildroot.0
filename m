From: Christian Stewart <christian@paral.in>
Date: Sun, 24 Jul 2016 14:25:51 -0700
Subject: [Buildroot] [PATCH v11 2/2] docker-engine: new package
In-Reply-To: <1469394628-19412-2-git-send-email-christian@paral.in>
References: <1469394628-19412-1-git-send-email-christian@paral.in>
 <1469394628-19412-2-git-send-email-christian@paral.in>
Message-ID: <CA+h8R2oKj0ONK=64YAj_8efpLSDJobpV5JRMoZLz9Qmv1k_W0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sun, Jul 24, 2016 at 2:10 PM, Christian Stewart <christian@paral.in> wrote:
> +       GOPATH="$(DOCKER_ENGINE_GOPATH)" \
> +       LIBRARY_PATH=$$LIBRARY_PATH:$(TARGET_DIR)/usr/lib/

The last line here can also be removed.

This version tested on aarch64, arm, and amd64 with the aufs and
overlayfs drivers, no problems.

Best,
Christian

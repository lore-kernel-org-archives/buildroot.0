From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Tue, 14 Oct 2014 12:57:13 -0500
Subject: [Buildroot] [PATCH] spidev_test: new package
In-Reply-To: <1413301553-1592-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413301553-1592-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <CAMQcK5KRHCPynHdzzGe7Mec50vCj-k-vtLDOGhQcmOCV7xvS+g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Tue, Oct 14, 2014 at 10:45 AM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in                  |  1 +
>  package/spidev_test/Config.in      | 15 +++++++++++++++
>  package/spidev_test/spidev_test.mk | 22 ++++++++++++++++++++++
>  3 files changed, 38 insertions(+)
>  create mode 100644 package/spidev_test/Config.in
>  create mode 100644 package/spidev_test/spidev_test.mk

I did this exact same thing but never got around to submitting this.
This is a very handy tool for checking out SPI devices from command
line.

Reviewed-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>

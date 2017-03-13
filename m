From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 13 Mar 2017 17:48:17 +0100
Subject: [Buildroot] [PATCH] kmscube: bump version to fix build failures
In-Reply-To: <1489422381-6163-1-git-send-email-festevam@gmail.com>
References: <1489422381-6163-1-git-send-email-festevam@gmail.com>
Message-ID: <CAAMH-yviw2QndhAhFum9tS=vt+Ta9QAvS6YZpS=963U3aENEtg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

On Mon, Mar 13, 2017 at 5:26 PM, Fabio Estevam <festevam@gmail.com> wrote:
> Bump kmscube version to fix build failures such as this one seen on sparc64:
> http://autobuild.buildroot.net/results/d7e/d7e82c67e0b04b0aea990bfb19dd6e4fd914bebe/build-end.log
>
> ,and also the one reported by Gary Bisson with Linaro 2017.02 ARM
> gnueabihf toolchain.

I confirm it fixes the build issue I was seeing.

Thanks,
Gary

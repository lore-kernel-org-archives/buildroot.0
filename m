From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 5 Oct 2016 19:24:38 -0300
Subject: [Buildroot] [PATCH] boot/uboot: Fix SPL binary installation
In-Reply-To: <9743a2fb-a71d-0d4a-438a-86756522143b@mind.be>
References: <1475704096-22801-1-git-send-email-festevam@gmail.com>
 <9743a2fb-a71d-0d4a-438a-86756522143b@mind.be>
Message-ID: <CAOMZO5CUJo8dT+zn3eGBamneogfMNGPmeiV2ioSi9zsFzjw3LA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Wed, Oct 5, 2016 at 7:14 PM, Arnout Vandecappelle <arnout@mind.be> wrote:

>  It has been mentioned in a number of threads: a better solution is to always
> 'make all' in UBOOT_BUILD_CMDS. This will also allow to remove many of the
> UBOOT_MAKE_TARGET assignments.
>
>  It hasn't been done yet because such a change should be tested against all the
> different U-Boot artefacts, and with different U-Boot versions.

Understood. Sounds a bit challenging/risky though.

Should we just revert fad58cefa4a392b ("boot/uboot: allow to build
multiple U-Boot images") to avoid the breakage in the meantime?

Thanks

From: Julien Olivain <juju@cotds.org>
Date: Wed, 18 Dec 2019 14:07:49 +0100
Subject: [Buildroot] [PATCH 2/2] configs/imx8qxpmek: Update to 4.14.98
 components
In-Reply-To: <CAOMZO5DhbKvUz3ZH7Pm1D3CtJ+h7-JCqeLSJP1U-Pa8FhjXNfQ@mail.gmail.com>
References: <20191217181855.3508-1-festevam@gmail.com>
 <20191217181855.3508-2-festevam@gmail.com>
 <CAOMZO5DhbKvUz3ZH7Pm1D3CtJ+h7-JCqeLSJP1U-Pa8FhjXNfQ@mail.gmail.com>
Message-ID: <cea508acd46cf9109f1ccb553ad8b429@cotds.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

On 2019-12-17 20:10, Fabio Estevam wrote:
> On Tue, Dec 17, 2019 at 3:19 PM Fabio Estevam <festevam@gmail.com> 
> wrote:
>> 
>> Bump kernel, ATF and U-Boot to the versions found in the NXP BSP 
>> 4.14.98.
>> 
>> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> 
> Please discard this patch, sorry.
> 
> I am getting a boot hang with this one applied.

Apparently, we experience here what I described earlier, in [1].
Updating U-Boot, Kernel and ATF will also need to realign 
imx-sc-firmware
to the same BSP version. When also applying patch [2] on top of yours,
I was able to boot the board again.

Best regards,

Julien.

[1] 
http://lists.busybox.net/pipermail/buildroot/2019-December/268824.html
[2] 
http://lists.busybox.net/pipermail/buildroot/2019-December/269334.html

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jan 2021 23:22:41 +0100
Subject: [Buildroot] [PATCH 2/2] package/uboot-tools: env/script
 generation need BINARIES_DIR
In-Reply-To: <20210125214255.GS2325@scaer>
References: <20210125145742.42460-1-matthew.weber@rockwellcollins.com>
 <20210125145742.42460-2-matthew.weber@rockwellcollins.com>
 <20210125221651.10112779@windsurf.home>
 <CANQCQpZvXB_w=VjTrPM45CYcCtxmvCZB7thxB8v=E6yNaWdw2A@mail.gmail.com>
 <20210125214255.GS2325@scaer>
Message-ID: <20210125232241.6f903f96@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 25 Jan 2021 22:42:55 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> On principle, I do agree with Thomas.
> 
> However, I would point out that this is way wider than just the script
> image. Indeed, we also have HOST_UBOOT_TOOLS_GENERATE_ENV_IMAGE which
> is only called at install time.

Well, the patch is also adding a mkdir inside the code generating the
environment image.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

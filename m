From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Jul 2017 22:54:26 +0200
Subject: [Buildroot] [PATCH 00/20] system: properly handle systemd as
 init system
In-Reply-To: <18557b86-2ac3-9545-064c-a54d025de773@cartelsol.com>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <CAAkeqgVMVSspUdMnPNWi_RQyLPhyf-1bys=d2btKrStEk34VMg@mail.gmail.com>
 <20170719225332.560a9a06@windsurf>
 <CAAkeqgWk1ywyCT027eGPtXfQO_qd5b7dEJSOZek8eMx1R1Ey+Q@mail.gmail.com>
 <20170720093228.19139327@windsurf>
 <45bb5a90-e48a-3edc-43ff-8cf9eefd20e6@cartelsol.com>
 <18557b86-2ac3-9545-064c-a54d025de773@cartelsol.com>
Message-ID: <20170728225426.23fd8b8c@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Jul 2017 22:41:07 +0200, Marcus Hoffmann wrote:

> >> BTW, for these bugs, if there is something easy we can add to the
> >> testing infrastructure to make sure it keeps working, it would be nice!  
> 
> I'm not yet familiar with the the testing infrastructure. Would that be
> something like providing a certain set of defconfigs, booting into the
> generated filesystems and testing if dns works?

Exactly that. The testing infrastructure makes it very easy to provide
a defconfig fragment, build it, boot it under Qemu, and run arbitrary
commands.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

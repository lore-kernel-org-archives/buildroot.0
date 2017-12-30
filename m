From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Dec 2017 18:27:55 +0100
Subject: [Buildroot] [PATCH 2/3] package/brltty: use gcc instead of ld
 to link shared objects
In-Reply-To: <20171230104804.16489-2-mlang@blind.guru>
References: <20171230104804.16489-1-mlang@blind.guru>
 <20171230104804.16489-2-mlang@blind.guru>
Message-ID: <20171230182755.3516738a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Dec 2017 11:48:03 +0100, Mario Lang wrote:
> Fixes:
>   http://autobuild.buildroot.net/results/2419741c43dea0f91859c19167c8d65cb54e1470
>   http://autobuild.buildroot.net/results/4b83e53c718520661dc99cde2121f69ce3fd08d7
> Signed-off-by: Mario Lang <mlang@blind.guru>
> ---
>  .../0003-Remove-MKOBJ-in-favour-of-MKMOD.patch     | 63 ++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 package/brltty/0003-Remove-MKOBJ-in-favour-of-MKMOD.patch

Applied to master after adding a reference to the upstream commit, as
suggested by Yann. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

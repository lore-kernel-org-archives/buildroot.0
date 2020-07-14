From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 22:21:56 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/qemu: add vnc support
In-Reply-To: <20200714165750.33726-1-jared.bents@rockwellcollins.com>
References: <20200714165750.33726-1-jared.bents@rockwellcollins.com>
Message-ID: <20200714222156.21d0aaed@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Jul 2020 11:57:49 -0500
Jared Bents <jared.bents@rockwellcollins.com> wrote:

> update to add vnc support to qemu if libvncserver is
> selected
> 
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
> --
> v1->v2: Update to handle suboptions for vnc support.
> ---
>  package/qemu/qemu.mk | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

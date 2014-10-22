From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Wed, 22 Oct 2014 11:29:00 -0500
Subject: [Buildroot] U-Boot Freescale PBL Image Format Support
Message-ID: <CAMQcK5LR05A2h62KPckDy=LQ+DbWL4Gv_pJUDVHVDNsQSAqUww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

In the meeting notes from the Buildroot Developer Days at ELCE, there
was a note about my pending patch series to add support to U-Boot for
the PBL image type. I still have interest in seeing these patches
merged but my attempts to get them reviewed have failed.

The patches are as follows:

[1/3] host-xxd: new package [1]
[2/3] uboot: separate out OMAP options and definitions [2]
[3/3] uboot: introduce u-boot.pbl format [3]

On the first patch I have only gotten minor feedback from Thomas D and
have not resubmitted due to patches 2 and 3 not being reviewed. If
someone would be willing to review the other patches and provided
feedback, I would be willing to rebase the suggestions onto the latest
master.

Thanks,
-Ryan

[1] - http://patchwork.ozlabs.org/patch/344795/
[2] - http://patchwork.ozlabs.org/patch/344796/
[3] - http://patchwork.ozlabs.org/patch/344797/

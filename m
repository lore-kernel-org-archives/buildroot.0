From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 2 Mar 2017 14:22:09 -0300
Subject: [Buildroot] libqeglfs.so not found on imx6
In-Reply-To: <CAD6G_RR5fC2n_JA=M1p3=0MeOwDXRVg2hQbhKDwHYmjyddu1SA@mail.gmail.com>
References: <CAD6G_RRX2RA3KDJyayDicTL-XbSNdHWK8z7JN-_HR3T9YD=oPw@mail.gmail.com>
 <CAAMH-yvFAXjR1z_R4_+FRec2k=MEmg85hPvBLY4UT5mty7NKUg@mail.gmail.com>
 <CAD6G_RQi8Gwk1hjqxtE=RtZoKpz30aJS1GX59JAGeUu02OP=1g@mail.gmail.com>
 <CAAMH-ys=MpSuBvT=weVPKhyu5_bz4feq7ePmMN4LgHKubG_9vQ@mail.gmail.com>
 <CAD6G_RR5fC2n_JA=M1p3=0MeOwDXRVg2hQbhKDwHYmjyddu1SA@mail.gmail.com>
Message-ID: <CAOMZO5B_d9-oq9R1NciG7F3A-HKhHVWP8uXzM=Crx2YB+zFVnw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 2, 2017 at 2:15 PM, Jagan Teki <jagannadh.teki@gmail.com> wrote:

> I've built GPU drivers as well, please see below kernel dmesg.
>
> dmesg:
> ---------
> [    1.002652] console [ttymxc3] enabled
> [    1.016395] etnaviv gpu-subsystem: bound 134000.gpu (ops gpu_ops)

I see you are using the mainline kernel.

You need to install mesa 17.0.0 and etnaviv gallium drivers (they are
available in the master branch now).

Then you can use kmscube for a quick test to check everything was
properly installed.

From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Fri, 17 Apr 2009 05:52:48 -0300
Subject: [Buildroot] Properly setting up hotplug
In-Reply-To: <35AF1D2435E24FA6B1C89344B22D099E@apexjs>
References: <35AF1D2435E24FA6B1C89344B22D099E@apexjs>
Message-ID: <d6cda7730904170152o5bfccb10u56409f747d8f1783@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, Apr 17, 2009 at 5:33 AM, Sagaert Johan <sagaert.johan@skynet.be> wrote:
> Hi
>
> cleaning :
>
> I don't trust the disclean, it most ends op in a mess.

Same here.

> If i do a clean i do :
>
> remove the entire root dir in project_build_arm
> remove .root? as well
> remove all contents from build_arm
> remove all stuff?in project_build_arm/../autotools-stamps.

I actually will do rm -rf build_* binaries project_* most of the time.
If I'm only fixing a package, I might just remove it's folder in the
build_*, but when I want to make sure everything is proper or when
creating an image to download to the device, I will even remove
toolchain_*

I don't like distclean because it will remove the downloaded files,
and clean usually leaves a lot of stuff in the rootfs.

Kind Regards,
   Thiago A. Correa

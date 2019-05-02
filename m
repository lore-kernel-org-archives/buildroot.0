From: Carlos A. M. dos Santos <unixmania@gmail.com>
Date: Wed, 1 May 2019 23:41:37 -0300
Subject: [Buildroot] [PATCH v3 2/2] package/busybox: add init script for
 sysctl
In-Reply-To: <CANQCQpa5ftm8xUxBTFoHK2969mOAUQf_tGMfMkBUiuZRpVaJOg@mail.gmail.com>
References: <20190501231140.6365-1-unixmania@gmail.com>
 <20190501231140.6365-2-unixmania@gmail.com>
 <CANQCQpa5ftm8xUxBTFoHK2969mOAUQf_tGMfMkBUiuZRpVaJOg@mail.gmail.com>
Message-ID: <CAJ4jsaegH-Wmxkhz=OmENo08D=KsQbUWQW4yBGYmDotF519_cQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 1, 2019 at 11:07 PM Matthew Weber <matthew.weber@collins.com> wrote:
>
> Carlos,
>
> Should the utilities used above be enabled automatically in the
> busybox config when this script is installed?  I.e. add .config fixups
> in the busybox.mk

It does not seem to be necessary, at the moment. The utilities are
already selected in the default busybox configuration.

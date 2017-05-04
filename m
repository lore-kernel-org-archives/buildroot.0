From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 4 May 2017 08:10:05 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-05-03
In-Reply-To: <20170504062805.21F8320C54@mail.free-electrons.com>
References: <20170504062805.21F8320C54@mail.free-electrons.com>
Message-ID: <CANQCQpZXApJkf7WPJjzVEXSyodyWZF5DJ2_OzfiYpe-jG6ruxg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Thu, May 4, 2017 at 1:28 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Build statistics for 2017-05-03
> ================================
>
>       successes : 202
>        failures : 86
>        timeouts : 0
>           TOTAL : 288
>
> Classification of failures by reason
> ====================================
>
>            host-protobuf-3.2.0 | 27
>            uboot-tools-2017.03 | 6

Worked around with this patchset
https://patchwork.ozlabs.org/patch/757382/

>                     mpir-3.0.0 | 5
>                acpica-20170303 | 4
>                  libqmi-1.18.0 | 4

Resolved by this patchset
https://patchwork.ozlabs.org/patch/757363/

<snip>

- Matt

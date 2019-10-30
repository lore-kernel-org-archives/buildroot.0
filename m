From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 30 Oct 2019 04:38:46 -0500
Subject: [Buildroot] [PATCH 1/1] package/rng-tools: needs NPTL
In-Reply-To: <20191030055850.6069-1-bernd.kuhls@t-online.de>
References: <20191030055850.6069-1-bernd.kuhls@t-online.de>
Message-ID: <CANQCQpZdUkkUSfd3RKkBDMG57=3mRt1hBU=w++gzK8PcQRpChw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,


On Wed, Oct 30, 2019 at 12:58 AM Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
>
> Fixes:
> http://autobuild.buildroot.net/results/e18/e1815b96997fb7def688e0aeb5d342fc64dbb64d/
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

$  ./utils/check-package package/rng-tools/*
99 lines processed
0 warnings generated

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>

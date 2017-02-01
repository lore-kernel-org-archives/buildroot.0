From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Feb 2017 22:21:48 +0100
Subject: [Buildroot] [PATCH 1/1] libcurl: optional verbose strings config
In-Reply-To: <CAGReGbRcsp25tZ=YV8+sFp2ZH17XZYhK7AVu2St7C1iKT3nfkA@mail.gmail.com>
References: <1485883613-48485-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20170201220318.06114262@free-electrons.com>
 <CAGReGbRcsp25tZ=YV8+sFp2ZH17XZYhK7AVu2St7C1iKT3nfkA@mail.gmail.com>
Message-ID: <20170201222148.5798ec02@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Feb 2017 15:15:20 -0600, Judd Meinders wrote:

> The original (and still) default selection of libcurl uses
> --disable-verbose so the new sub option is meant to merely provide the
> availability to include the verbose output as a library feature.  I
> wasn't thinking target size I guess.

My point was that if the size increase caused by --enable-verbose was
really small, then having a Buildroot sub-option just for this would
really be pointless.

More config options in Buildroot means more complexity, more
combinations of configurations, and therefore more chances for things
to break. Hence we always think twice about adding new configuration
options.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

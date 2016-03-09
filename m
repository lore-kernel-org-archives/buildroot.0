From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Mar 2016 09:32:50 +0100
Subject: [Buildroot] [PATCH v4] android-tools: add new package
In-Reply-To: <CAAMH-yu+m5+wY9YGFUGLiWNwTzsxQmmX9yXQWsM0X_UpDtbFwg@mail.gmail.com>
References: <1448296032-7781-1-git-send-email-gary.bisson@boundarydevices.com>
 <CAFGQKxcZERH0vMo8S_gE-YFWN_etHCB2xcAaBvzqgALRj5s7wg@mail.gmail.com>
 <CAAMH-ys65yXKR+T3K304Dk9iyrzeJr6Z7g-ARH9N0zOrNcNE_g@mail.gmail.com>
 <57351aed-03da-40ff-9c76-a384f847820e@MAIL-SINTERS-01.sinters-int.fr>
 <CAAMH-yu+m5+wY9YGFUGLiWNwTzsxQmmX9yXQWsM0X_UpDtbFwg@mail.gmail.com>
Message-ID: <20160309093250.3aecc01e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gary,

On Wed, 9 Mar 2016 09:20:15 +0100, Gary Bisson wrote:

> Thomas, rebasing that patch I realized it doesn't apply cleanly on
> master right now due to packages/Config.in.host. Also, I realized the
> package Config.in.host is missing "host " in its bool description. Do
> you want me to send a v5?

Nah, not really needed. Don't bother doing a v5 just for those two
small changes. I can fix those up when applying.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

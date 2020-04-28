From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Apr 2020 07:40:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/wlroots: bump to version 0.10.1
In-Reply-To: <20200428043338.117932-1-james.hilliard1@gmail.com>
References: <20200428043338.117932-1-james.hilliard1@gmail.com>
Message-ID: <20200428074035.113f67d9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Apr 2020 22:33:38 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> wlroots dropped RDP backend support in:
> https://github.com/swaywm/wlroots/commit/ebdbe177d62d3c8bab04f77b86326804ff185bef
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  Config.in.legacy             | 6 ++++++

The Config.in.legacy handling was not needed: wlroots was added very
recently, and was never part of any release. So we don't care about
legacy handling. I dropped it and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

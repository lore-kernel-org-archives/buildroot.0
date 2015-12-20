From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 15:15:46 +0100
Subject: [Buildroot] [PATCH 1/1] Add more options to eudev package.
In-Reply-To: <CAOcYpt2ah7+P2ZJyzN+i0DjxE+x9LiDZPWwg6zqMxzi-x7BhKQ@mail.gmail.com>
References: <CAOcYpt2ah7+P2ZJyzN+i0DjxE+x9LiDZPWwg6zqMxzi-x7BhKQ@mail.gmail.com>
Message-ID: <20151220151546.1fbf342f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear David Kosir,

On Tue, 20 Oct 2015 20:44:25 +0200, David Kosir wrote:
> From de239fceb033d278ef70924bcea5c0a18b1f930d Mon Sep 17 00:00:00 2001
> From: David Kosir <david.kosir@bylapis.com>
> Date: Tue, 20 Oct 2015 19:45:28 +0200
> Subject: [PATCH 1/1] Add more options to eudev package.
> 
> Making possible to install only in /, avoiding /usr.
> Also, make opinional to use kmod.
> 
> Signed-off-by: David Kosir <david.kosir@bylapis.com>
> ---
>  package/eudev/Config.in | 12 +++++++++++-
>  package/eudev/eudev.mk  | 16 +++++++++++++---
>  2 files changed, 24 insertions(+), 4 deletions(-)

Your patch received a good number of comments, especially from Arnout.
Could you take them into account and post an updated version of your
patch?

In the mean time, I'll mark your patch as "Changes Requested" in our
patch tracking system, which means that if you don't send a new
version, we'll forget about it.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

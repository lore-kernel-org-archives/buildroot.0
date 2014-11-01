From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 14:43:54 +0100
Subject: [Buildroot] [PATCH 0/2] RWD Website
In-Reply-To: <1414770651-23358-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1414770651-23358-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20141101144354.66e2e698@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Fri, 31 Oct 2014 16:50:49 +0100, Angelo Compagnucci wrote:
> This patch series implements an RWD website.
> 
> The patch is splitted in two:
> 
> The first one upgrades to bootstrap 3.2, jquery 1.11.1 and removes older files.
> The second one contains the RWD rework.
> 
> Angelo Compagnucci (2):
>   docs: RWD website - upgrading bootstrap/jquery
>   docs: RWD website

Both patches applied, thanks. The first patch didn't apply properly, as
the very long lines of the css/js code have been mangled either by git
send-email (unlikely) or by one of the e-mail servers (very possible).
Anyway, I've recreated the patch by updating jQuery and Bootstrap to
the same versions, and removed the useless files as your patch was
doing.

Thanks a lot for having worked on this!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

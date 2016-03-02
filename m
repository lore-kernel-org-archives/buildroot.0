From: Christian Stewart <christian@paral.in>
Date: Wed, 02 Mar 2016 21:52:09 +0000
Subject: [Buildroot] [PATCH 0/4] Add go language support
In-Reply-To: <1456955234.13916.34.camel@infradead.org>
References: <cover.1456946494.git.geoff@infradead.org>
 <20160302214959.419006f6@free-electrons.com>
 <1456955234.13916.34.camel@infradead.org>
Message-ID: <1456955529541-4c47621a-58540498-011499af@mixmax.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,
On Wed, Mar 2, 2016 at 4:47 PM Geoff Levand <geoff@infradead.org> wrote: >> http://patchwork.ozlabs.org/patch/542108//
>> (from Christian Stewart)

>I did see this is now out of date, building go compiler version
>1.4.2. It also doesn't seem to install the go tools. To bring
>these up to date would need almost a complete re-write since
>the current compiler now requires a bootstrap compiler. I
>think my patches superseed this series.
This is correct. I built the original series with Yann as a solution to
implement Docker under Buildroot, which worked fine for our project. If there is
some other better series that implements the Go compiler as well as the ?go?
tools installed into the target, I can adapt the other packages in my series
(Docker, Aufs-Utils, etc) to support the superseeding packages.
I'm fine with going ahead with this.
Best, Christian
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160302/2113e9a3/attachment.html>

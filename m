From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 15:50:30 +0200
Subject: [Buildroot] [1/1,RFC] mysql: replace mysql with mariadb 10.0
In-Reply-To: <0775fdeb-5056-73cd-4cf8-7d4edeb6d8a7@mind.be>
References: <afcad3cc-5a25-a410-ef18-b6a18ed45406@je-eigen-domein.nl>
 <0775fdeb-5056-73cd-4cf8-7d4edeb6d8a7@mind.be>
Message-ID: <20160917155030.3eb602eb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Sep 2016 23:17:51 +0200, Arnout Vandecappelle wrote:

> > How responsible is it to keep packages in such state around, when there do are
> > alternatives?  
> 
>  True. But it should be relatively easy to bump the existing mysql package. If
> it is completely replaced by mariadb, it won't be so easy anymore.
> 
>  We could mark mysql as deprecated pending the bump. That could motivate people
> to step up and fix it.

As Floris said, our mysql package is deprecated, so I'm all for
replacing it with an up-to-date mariadb package. If later on, someone
else really needs MySQL, we can re-add it, and add the necessary
virtual package to allow selecting between mysql and mariadb. But until
there's a decent mysql package available, I believe replacing it
completely with an up-to-date mariadb package is better.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

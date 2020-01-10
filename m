From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 10 Jan 2020 08:55:51 +0100
Subject: [Buildroot] [PATCH] package/iputils: use relative symlink for
 ping6
In-Reply-To: <20200110073359.14568-1-peter@korsgaard.com>
References: <20200110073359.14568-1-peter@korsgaard.com>
Message-ID: <20200110075551.GA32415@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

> Fixes (part of):
> http://autobuild.buildroot.net/results/5659e1c91831921bd9ad6af670258783771b4dc8/

> Commit 6b37dda2a972cdf (package/iputils: create ping6 symlink), added a
> ping6 symlink, but used the absolute (build) path to ping as the target,
> which is naturally no good at runtime:

> ls -l target/bin/ping6
> lrwxrwxrwx 1 peko peko 58 Jan 10 08:25 target/bin/ping6 -> /home/peko/source/buildroot/output-iputils/target/bin/ping

> Instead use a relative symlink.

Thanks for a fix.
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 00:06:13 +0200
Subject: [Buildroot] [PATCH 11/16] erlang-p1-xml: bump to version 1.1.22
In-Reply-To: <20170530145211.15320-12-johan.oudinet@gmail.com>
References: <20170530145211.15320-1-johan.oudinet@gmail.com>
 <20170530145211.15320-12-johan.oudinet@gmail.com>
Message-ID: <20170531000613.57dffa7b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 30 May 2017 16:52:06 +0200, Johan Oudinet wrote:
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>

Commit log was a bit too terse: you're adding a host variant of the
package, it should have been explained (or be part of a separate
patch). I've tweaked the commit log to mention this.

> ---
>  .../0001-remove-dependencies-from-rebar-config.patch   | 18 ++++++++++++++++++

We have such a patch on many rebar packages. Is there a plan to have an
upstream way to tell rebar to not automatically download dependencies,
without having to patch each and every package ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

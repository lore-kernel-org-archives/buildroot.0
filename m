From: Koen Martens <gmc@sonologic.nl>
Date: Mon, 2 Sep 2019 20:06:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/capnproto: increase gcc version
 dependency
In-Reply-To: <20190821132153.GC26497@coltrane>
References: <20190821132153.GC26497@coltrane>
Message-ID: <20190902180658.GD19904@coltrane>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi List,

On Wed, Aug 21, 2019 at 03:21:54PM +0200, Koen Martens wrote:
> The new version of capnproto requires c++14, therefore
> the dependency has been increase from at least gcc 4.8
> to at least gcc 5.x.
> 
> This patch should be applied to a branch that already
> has the patch that increases the capnproto version to
> 0.7.0. At the time of writing this, that means the next
> branch.

This patch hasn't been merged yet, but i'm unsubscribing from the
list again because the volume is overwhelming my inbox. If anyone
wants to discuss this patch, please mail me off-list.

Cheers,

Koen

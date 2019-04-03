From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 3 Apr 2019 09:18:56 +0200
Subject: [Buildroot] [PATCH] package/luajit: bump to version 2.1.x
 developpment version
In-Reply-To: <1554216575-24134-1-git-send-email-jugurtha.belkalem@smile.fr>
References: <1554216575-24134-1-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <20190403091856.274fdc7e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  2 Apr 2019 16:49:35 +0200
Jugurtha BELKALEM <jugurtha.belkalem@smile.fr> wrote:

> In order to integrate bcc (front end tool for eBPF) into buildroot
> and testing it on a Raspberry PI 3; We need to upgrade the version
> of luajit to 2.1.0 to support aarch64.
> 
> Currently, luajit aarch64_be support has not been tested.
> 
> Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> Cc: Francois Perrad <francois.perrad@gadz.org>

Perhaps this can be done as part of a larger patch series that
introduces 'bcc' as well ? By that time, hopefully LuaJIT 2.1.0 will
have been released, and we'll be good ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

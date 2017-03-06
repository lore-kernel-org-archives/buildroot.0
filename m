From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Mar 2017 16:25:22 +0100
Subject: [Buildroot] [PATCH 1/1] libwebsockets: cherry-pick upstream
 patch for v2.1.1
In-Reply-To: <20170306144139.GA14390@airbook.vandijck-laurijssen.be>
References: <20170305182748.GJ24886@airbook.vandijck-laurijssen.be>
 <20170306091911.05fb09c2@free-electrons.com>
 <20170306104327.GC24367@airbook.vandijck-laurijssen.be>
 <20170306143901.0cb1e1f6@free-electrons.com>
 <20170306144139.GA14390@airbook.vandijck-laurijssen.be>
Message-ID: <20170306162522.3d32077b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 6 Mar 2017 15:41:39 +0100, Kurt Van Dijck wrote:
> This commit cherry-picks an upstream patch that fixes a compile error
> that was introduced in v2.1.1
> 
> Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>

Thanks, I've applied with a minor change, see below.

> +# patch specific for v2.1.1

This comment really isn't needed. A patch is always specific to a
version. And the fact it comes from the upstream Git repository makes
it extra clear that it most likely should be dropped the next time we
bump this package.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

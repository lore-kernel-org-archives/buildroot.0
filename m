From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jan 2015 09:34:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/iojs: new package
In-Reply-To: <1421278696-15122-1-git-send-email-jkrause@posteo.de>
References: <1421278696-15122-1-git-send-email-jkrause@posteo.de>
Message-ID: <20150115093427.0b5118b2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Thu, 15 Jan 2015 00:38:16 +0100, J?rg Krause wrote:
> io.js is a fork of Node.js. This package is mainly based on the nodejs
> package, except for the patches.
> 
> io.js is currently marked as unstable and there is no stable release for now.
> 
> Signed-off-by: J?rg Krause <jkrause@posteo.de>

Immediate question that comes to mind: is the code base diverging from
Node.js ? Do we need two separate packages ? Does this fork has a
chance of becoming widely used ? I'm a bit concerned by the fact of
having two separate packages for basically the same thing.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Sep 2019 23:23:00 +0200
Subject: [Buildroot] [PATCH] package/python-entrypoints: new package
In-Reply-To: <20190525220058.2796-1-sergei.sakhno@gmail.com>
References: <20190525220058.2796-1-sergei.sakhno@gmail.com>
Message-ID: <20190925232300.437a503d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm adding Yegor Yefremov in Cc.

On Sun, 26 May 2019 01:00:58 +0300
Serhii Sakhno <sergei.sakhno@gmail.com> wrote:

> Signed-off-by: Serhii Sakhno <sergei.sakhno@gmail.com>

How does this compare to python-fastentrypoints that we already have ?
Do we need both ?

Also, for python-fastentrypoints we only have a host variant of the
package, as it's only meant to be executed during the build. Why does
python-entrypoints needs both a target and host package ?

A more verbose commit log would have helped a bit to understand the use
case for this package.

Also, an entry in the DEVELOPERS file should be added.

Asaf, Yegor, if you have any comments/suggestion/opinion, I'm
interested :-)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

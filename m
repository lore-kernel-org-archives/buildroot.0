From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 11:56:06 +0200
Subject: [Buildroot] [PATCH v2, 1/1] package/domoticz: bump to version
 0f411f781ae4fb4a82f592d38a3f40578c149533
In-Reply-To: <20190803092231.2308-1-fontaine.fabrice@gmail.com>
References: <20190803092231.2308-1-fontaine.fabrice@gmail.com>
Message-ID: <20190803115606.09e8faee@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 Aug 2019 11:22:31 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Replace first patch to fix build when using a development version
> - Fix build with openzwave 1.6 through:
>   https://github.com/domoticz/domoticz/commit/56d3fa099d9c98222d6cf5043891c6ba2f1df6bf
> - Add patch to revert cmake 3.14 dependency as buildroot currently
>   requires only 3.8

But if they require it, they probably have a reason, no ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

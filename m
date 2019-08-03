From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 10:19:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/domoticz: bump to version
 0f411f781ae4fb4a82f592d38a3f40578c149533
In-Reply-To: <20190803073214.9102-1-fontaine.fabrice@gmail.com>
References: <20190803073214.9102-1-fontaine.fabrice@gmail.com>
Message-ID: <20190803101901.2a118092@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for looking into this!

On Sat,  3 Aug 2019 09:32:14 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Replace first patch to fix build when using a development version
> - Fix build with openzwave 1.6 through:
>   https://github.com/domoticz/domoticz/commit/56d3fa099d9c98222d6cf5043891c6ba2f1df6bf
> - Add patch to revert cmake 3.14 dependency

Why are you reverting this patch ? It should ideally be explained
somewhere, either here, or in the commit log of the patch itself.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Jan 2020 23:13:52 +0100
Subject: [Buildroot] [PATCH 1/2] package/libsigrok: add optional
 bluez-utils dependency
In-Reply-To: <20200106182420.2833708-1-fontaine.fabrice@gmail.com>
References: <20200106182420.2833708-1-fontaine.fabrice@gmail.com>
Message-ID: <20200110231352.5a1fb06b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  6 Jan 2020 19:24:19 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> bluez-utils has been added since version 0.5.2 and
> https://github.com/sigrokproject/libsigrok/commit/f085705f4888f8127c80539e0fcd1cb3974bdff2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libsigrok/libsigrok.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Both patches applied. That being said, I think it is probably time to
remove the bluez_utils package from Buildroot. The 4.x version of BlueZ
is deprecated since a very long time.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

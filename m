From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 17:16:32 +0100
Subject: [Buildroot] [PATCH] package/alsamixergui: add license
 information
In-Reply-To: <a0915233-820b-2622-ed75-4ec3ef8e0e7c@grandegger.com>
References: <a0915233-820b-2622-ed75-4ec3ef8e0e7c@grandegger.com>
Message-ID: <20170302171632.0b2fa9b5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 2 Mar 2017 17:06:10 +0100, Wolfgang Grandegger wrote:

>  ALSAMIXERGUI_VERSION = 0.9.0rc2-1
>  ALSAMIXERGUI_SOURCE = alsamixergui_$(ALSAMIXERGUI_VERSION).orig.tar.gz
>  ALSAMIXERGUI_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/a/alsamixergui
> +ALSAMIXERGUI_LICENSE = GPLv3+

Where did you get this GPLv3+ information? I'm seeing GPLv2+, not
GPLv3+.

> +ALSAMIXERGUI_LICENSE_FILES = COPYING

There is no COPYING file in the alsamixergui source code, so I don't
see how this can work. Did you test "make legal-info" after adding this?

Since there is no COPYING file, I would suggest to use debian/copyright
as a license file.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

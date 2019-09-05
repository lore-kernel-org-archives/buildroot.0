From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Sep 2019 20:49:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv3: python support needs
 .py modules
In-Reply-To: <20190905184403.19368-1-fontaine.fabrice@gmail.com>
References: <20190905184403.19368-1-fontaine.fabrice@gmail.com>
Message-ID: <20190905204902.127ebdaf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Thu,  5 Sep 2019 20:44:03 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - https://bugs.buildroot.org/show_bug.cgi?id=12171
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks for the patch. A better commit log would be nice. But more
importantly, do we understand why it absolutely needs the .py file ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

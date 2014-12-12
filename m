From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Dec 2014 12:07:34 +0100
Subject: [Buildroot] buildroot 2014.11, custom gcc version
In-Reply-To: <2249171418381492@web19h.yandex.ru>
References: <2249171418381492@web19h.yandex.ru>
Message-ID: <20141212120734.1b735708@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nikita Orlov,

On Fri, 12 Dec 2014 13:51:32 +0300, Nikita Orlov wrote:

> How to choose custom gcc version in latest buildroot?
> It seems for some reason such feature was deleted from buildroot.
> 
> Are there any right way to add this feature, not using dirty hacks?

For any package, you can specify a custom source directory by using
<pkg>_OVERRIDE_SRCDIR, see "8.11.6. Using Buildroot during development"
in http://buildroot.org/downloads/manual/manual.html.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

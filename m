From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Dec 2019 12:31:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/strace: move default in
 Config.in
In-Reply-To: <20191226223726.265446-1-fontaine.fabrice@gmail.com>
References: <20191226223726.265446-1-fontaine.fabrice@gmail.com>
Message-ID: <20191227123119.3d3b4d6d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 26 Dec 2019 23:37:26 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit d52e98655fb6b00606ffe5294051ff0581c464bf set a default after
> "depends on", move it before to fix make check-package
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Wow, thanks for noticing! But d52e98655fb6b00606ffe5294051ff0581c464bf
should not have made this change at all, it is completely unrelated to
the sysrepo change. So we simply need to drop this "default n".

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

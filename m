From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 May 2020 22:47:16 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/reaver: bump to v1.6.6
In-Reply-To: <20200528102753.9145-1-guillaume.bressaix@gmail.com>
References: <CAPi7W82evHYV9vAO2GGPR-m-wBh3EfFBVqO_x74P5CevJvir6Q@mail.gmail.com>
 <20200528102753.9145-1-guillaume.bressaix@gmail.com>
Message-ID: <20200528224716.38d49060@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 28 May 2020 12:27:54 +0200
"Guillaume W. Bres" <guillaume.bressaix@gmail.com> wrote:

> ---
> Changes v1 -> v2:
> 	- add comment on BR2_TOOLCHAIN_HAS_THREADS dependency
> 	to help user (suggested by Fabrice)
> 
> Changes v0 -> v1:
>         - correct patch title for package upgrade
>         - add white space to reaver.hash
>         - add depends on BR2_TOOLCHAIN_HAS_THREADS (suggested by Fabrice)
> 
> v0: upgrade to 1.6.6 (latest) release
> I removed the patch because it is not needed anymore.
> Tested on RPi0w.
> 
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>

The Signed-off-by should have been in the commit log, i.e before the "---" sign.

It seems like you got confused by this. A commit log should look like
this:

package/foobar: bump to 1.2.3

This is some additional explanations about this change.

And some other explanation.

Signed-off-by: John Doe <john.doe@buildroot.org>
---
Changes from v1:
 - ...

package/reaver/0001-fix-271.patch | 32 -------------------------------
package/reaver/Config.in          |  4 ++++
package/reaver/reaver.hash        |  4 ++--
package/reaver/reaver.mk          |  2 +-
4 files changed, 7 insertions(+), 35 deletions(-)
delete mode 100644 package/reaver/0001-fix-271.patch

Does that clarify the expected organization ?

I've fixed that up, and applied your patch to our next branch.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

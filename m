From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 11:07:13 +0200
Subject: [Buildroot] [PATCH] qt/qt5webchannel: new package
In-Reply-To: <1437551725-24160-1-git-send-email-corjon.j@ecagroup.com>
References: <1437551725-24160-1-git-send-email-corjon.j@ecagroup.com>
Message-ID: <20150722110713.6be3ca53@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Julien Corjon,

On Wed, 22 Jul 2015 09:55:25 +0200, Julien Corjon wrote:
> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
> ---
> v1
>   - This patch is rebased from qt5.5.0 bump commited serie
>   - Add a package patch for build without qml module (bug spotted by Thomas)

I'm certainly not sure the patch to fix the !qml build issue is the
right one, we'll see what upstream says. But other than that, the
package looks good, so let's get some autobuilder coverage of it.

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

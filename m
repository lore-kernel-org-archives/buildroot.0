From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 21:52:13 +0100
Subject: [Buildroot] [PATCH 1/1] lirc-tools: add
 LIRC_TOOLS_INSTALL_STAGING = YES to get the library headers into sysroot
 for develop lirc based applications.
In-Reply-To: <1456724766-22083-1-git-send-email-michael.schenk@albistechnologies.com>
References: <1456724766-22083-1-git-send-email-michael.schenk@albistechnologies.com>
Message-ID: <20160229215213.574d5dca@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Michael Schenk,

On Mon, 29 Feb 2016 06:46:06 +0100, Michael Schenk wrote:
> Signed-off-by: Michael Schenk <michael.schenk@albistechnologies.com>
> ---
>  package/lirc-tools/lirc-tools.mk | 1 +
>  1 file changed, 1 insertion(+)

The commit title was really too long. The format of a commit log should
be:

"""
<package>: <some short description>

<some more details here which can span multiple lines>

<some additional details as well>

Signed-off-by: ...
"""

The "<package>: <some short description>" part should typically fit
within 80 characters or so.

So, I've changed your commit log, and applied to our next branch. See
https://git.busybox.net/buildroot/commit/?h=next&id=d0071cddc0eb2cd7569b2c25d817cabafcef2993
for the final commit.

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

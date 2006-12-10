From: Bernhard Fischer <rep.nop@aon.at>
Date: Sun, 10 Dec 2006 14:59:34 +0100
Subject: [Buildroot] [PATCH] udev package fixes
In-Reply-To: <20061208200654.GB3087@ibawizard.net>
References: <20061208200654.GB3087@ibawizard.net>
Message-ID: <20061210135934.GC4442@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 08, 2006 at 09:06:54PM +0100, Petr Stetiar wrote:
>This patch fixes two issues in udev package:
>
>1. mkdir: cannot create directory `/root/src/buildroot/build_i686/root/ 
>   etc/udev/rules.d': No such file or directory
>2. /usr/bin/install: cannot stat `package/udev/udev.conf': No such file or
>   directory

Applied, thanks.
PS: please send patches so they can be applied with -p1 from the
toplevel source-directory.

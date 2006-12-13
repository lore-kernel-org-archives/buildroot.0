From: Bernhard Fischer <rep.nop@aon.at>
Date: Wed, 13 Dec 2006 20:28:08 +0100
Subject: [Buildroot] Using external toolchain / disabling Buildroot
	toolchain
In-Reply-To: <287497.12093.qm@web50006.mail.yahoo.com>
References: <loom.20061213T195208-342@post.gmane.org>
	<287497.12093.qm@web50006.mail.yahoo.com>
Message-ID: <20061213192808.GB23970@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 13, 2006 at 02:13:45PM -0500, Alex Song wrote:
>I had this situation before since we were forced to
>use glibc. I'm not sure of a better, easier or
>preferred way but I modified the files and only used
>buildroot to build the packages.

It would be nice if using an external toolchain would be optional
without breaking the possibility to switch to a uclibc/gcc combo.

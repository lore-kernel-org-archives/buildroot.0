From: Bernhard Fischer <rep.nop@aon.at>
Date: Wed, 29 Nov 2006 09:48:29 +0100
Subject: [Buildroot] [PATCH] acpid vs gcc-4.1.1 fix
In-Reply-To: <1164768906.4016.72.camel@dv>
References: <1164768906.4016.72.camel@dv>
Message-ID: <20061129084829.GB26441@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 28, 2006 at 09:55:06PM -0500, Pavel Roskin wrote:
>acpid is compiled with -Werror, and gcc 4.1.1 warns about mismatching
>pointers.  Fix it by using socklen_t type.
>
>Modify acpid.mk to apply all available patches.  Convert ACPI_SOCKETFILE
>adjustment from sed script to a patch.
>
>Please make sure to add the new 2 patches to Subversion.

Merged as r16712.
thanks,

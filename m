From: Bernhard Fischer <rep.nop@aon.at>
Date: Fri, 15 Dec 2006 15:31:07 +0100
Subject: [Buildroot] [patch] file update, fixes
In-Reply-To: <200612151429.50225.uli@suse.de>
References: <200612151429.50225.uli@suse.de>
Message-ID: <20061215143107.GC13757@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 15, 2006 at 02:29:50PM +0100, Ulrich Hecht wrote:
>Hi!
>
>Bumps version to 4.19, moves static lib and include file to STAGING_DIR.

Another candidate.

FILE_SOURCE_DIR:=$(BUILD_DIR)/file-$(FILE_VER)
FILE_DIR1:=$(BUILD_DIR)/file-$(FILE_VER)-target
FILE_DIR2:=$(TOOL_BUILD_DIR)/file-$(FILE_VER)

Don't forget to CC="$(HOSTCC)" for the -host version.

Please resend? :)

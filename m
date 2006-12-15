From: Ulrich Hecht <uli@suse.de>
Date: Fri, 15 Dec 2006 16:04:20 +0100
Subject: [Buildroot] [patch] file update, fixes
In-Reply-To: <20061215143107.GC13757@aon.at>
References: <200612151429.50225.uli@suse.de> <20061215143107.GC13757@aon.at>
Message-ID: <200612151604.20630.uli@suse.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On Friday 15 December 2006 15:31, Bernhard Fischer wrote:
> Another candidate.
>
> FILE_SOURCE_DIR:=$(BUILD_DIR)/file-$(FILE_VER)
> FILE_DIR1:=$(BUILD_DIR)/file-$(FILE_VER)-target
> FILE_DIR2:=$(TOOL_BUILD_DIR)/file-$(FILE_VER)
>
> Don't forget to CC="$(HOSTCC)" for the -host version.
>
> Please resend? :)

Alright, alright. But I would sure like to know what a "host file" is 
good for. I don't see anything that depends on it.

CU
Uli
-------------- next part --------------
A non-text attachment was scrubbed...
Name: file.patch
Type: text/x-diff
Size: 2710 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20061215/62370ec5/attachment.bin 

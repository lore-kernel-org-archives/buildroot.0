From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Jan 2013 18:56:34 +0100
Subject: [Buildroot] [PATCH 1/1 V2] cairo : bump version to 1.12.8
In-Reply-To: <1358097082-24212-1-git-send-email-sagaert.johan@skynet.be>
References: <1358097082-24212-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <20130113185634.08a6f635@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Sun, 13 Jan 2013 18:11:22 +0100, Sagaert Johan wrote:
> 
> Patch v2 : The patch for 1.10.2 is no longer needed with cairo version 1.12.8.

Why? Has it been merged upstream?

Also, your commit log is still improperly formatted. Please look
*carefully*:

==
cairo: bump to version 1.12.8

The patch for 1.10.2 is no longer needed with cairo version 1.12.8

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
Changes since v1:
 - Explain why patch is no longer needed
==

So:

 * There must be *ONE* and only *ONE* empty line between the commit
   title ("cairo: bump ...") and the core of the commit log. You always
   put two newlines, this is useless.

 * There must be *ONE* and only *ONE* empty line between the last
   paragraph of the commit log and the Signed-off-by line.

 * The changelog (which explain the change since the previous versions
   of your patch) must be after the --- marker so that the contents of
   the changelog is not kept in history.

Please look carefully at how other do patches, and try to do the same.
This will avoid you the need to send gazillions of versions of the same
patch just because of basic formatting problems.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

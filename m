From: Norbert Lange <nolange79@gmail.com>
Date: Fri, 15 Mar 2019 14:30:29 +0100
Subject: [Buildroot] package/libfuse3: new package [V2]
Message-ID: <20190315133033.5275-1-norbert.lange@andritz.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

New since V1:
-   be more verbose both in commit msg as in comments
    about sharing files between libfuse3 and libfuse
-   add *_DEVICES for static device table
-   add myself to DEVELOPERS
-   rework target installation for libfuse.
    Now installs to temp dir first, to not overwrite files
    from libfuse3
-   adopt patch that fixes installation
    now allows some failures instead removing the operation

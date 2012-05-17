From: Michael J. Hammel <buildroot@graphics-muse.org>
Date: Wed, 16 May 2012 21:01:51 -0600
Subject: [Buildroot] connman requirement for resolver in toolchain
Message-ID: <1337223711.1915.3.camel@galileo.gfxmuse.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm looking at adding connman to my build. It appears that connman can't
be enabled unless the toolchain includes resolver support.  

How does the config check for that?  I didn't see any Buildroot config
options to specify that my external toolchain has that nor is there any
option in Crosstool-NG (my toolchain) to enable it in the C library.

I'm using Buildroot 2012-02 and Crosstool-NG 1.13.4.

-- 
Michael J. Hammel <buildroot@graphics-muse.org>

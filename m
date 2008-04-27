From: p <pmeloy@shaw.ca>
Date: Sun, 27 Apr 2008 06:41:27 -0700
Subject: [Buildroot] QWidget cannot check for file existence when cross
	compiling
In-Reply-To: <20080427095133.504A83C6E3@busybox.net>
References: <20080427095133.504A83C6E3@busybox.net>
Message-ID: <1209303687.31310.6.camel@rhodan.rho>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've been trying to get past this error:

checking QT_LIBS... -L/home/pat/buildroot/build_arm/staging_dir/usr/lib
-lQtGui -lpng -lQtNetwork -lQtCore -lz -lm -lrt -lpthread -ldl  
checking
for /home/pat/buildroot/build_arm/staging_dir/usr/include/QtGui/QWidget... configure: error: cannot check for file existence when cross compiling
make: ***
[/home/pat/buildroot/build_arm/classpath-0.97.1/.stamp_configured] Error
1

I checked and the QWidget file does exist in the path specified. I
thought maybe it was something missing on the host so I installed
everything QT4ish that seemed remotely appropriate.

I just checked out the buildroot SVN this morning and modified the
qtopia4.mk to use a few different snapshots of 4.4.0 (the original
snapshot specified no longer exists) but always the same result.

Any clues as to how to get past this?

From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 02 Feb 2012 21:36:39 +0100
Subject: [Buildroot] install-to-staging OK but install-to-target fails
In-Reply-To: <D921DC3114DE02419F1BFD413E98678E102B2859C8@VA3DIAXVS331.RED001.local>
 (Edward Endejan's message of "Thu, 2 Feb 2012 12:04:47 -0800")
References: <D921DC3114DE02419F1BFD413E98678E102B2859C8@VA3DIAXVS331.RED001.local>
Message-ID: <87d39x7z1k.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Edward" == Endejan, Edward <Edward.Endejan@dmh-global.com> writes:

 Edward> Hi,
 Edward> I'm attempting to build gstreamer and gst-plugins-base from git 
 Edward> repositories with buildroot, cross-compiling for ARM. The build 
 Edward> and install-to-staging phases complete without error, but then 
 Edward> install-to-target fails as follows:

It works here. Care to post your buildroot defconfig (run make
savedefconfig to create it).

-- 
Bye, Peter Korsgaard

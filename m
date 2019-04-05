From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Apr 2019 22:34:55 +0200
Subject: [Buildroot] [PATCH v2 1/4] package/libfuse: Install udev rules
 and set permissions
In-Reply-To: <8736n0gm7a.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Tue, 02 Apr 2019 22:56:57 +0200")
References: <20190315133033.5275-1-norbert.lange@andritz.com>
 <20190315133033.5275-2-norbert.lange@andritz.com>
 <8736n0gm7a.fsf@dell.be.48ers.dk>
Message-ID: <87y34onqc0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Norbert" == Norbert Lange <nolange79@gmail.com> writes:
 >> This fixes some omissions from the installation.
 >> Install the udev rules.

 >> Tell buildroot about the fuse device.

 >> Apply setuid permissions on the fusermount tool.

 >> Signed-off-by: Norbert Lange <norbert.lange@andritz.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard

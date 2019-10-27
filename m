From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Oct 2019 11:00:54 +0100
Subject: [Buildroot] [PATCH] package/test-vm: a virtual machine image to
 test libvirt
In-Reply-To: <20191025002124.5004-1-unixmania@gmail.com> (unixmania's message
 of "Thu, 24 Oct 2019 21:21:24 -0300")
References: <20191025002124.5004-1-unixmania@gmail.com>
Message-ID: <87ftjejynd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "unixmania" == unixmania  <unixmania@gmail.com> writes:

 > From: Carlos Santos <unixmania@gmail.com>
 > Builds and installs a virtual machine disk image to test libvirt. Only
 > x86_64 is supported at the moment. Refer to package/test-vm/readme.txt
 > for instructions.

 > Signed-off-by: Carlos Santos <unixmania@gmail.com>

Cute! I'm not too happy about making a visible package for this though,
right next to tar. How about adding it to a br2-external under
support/testing/conf and use it in a runtime test?

-- 
Bye, Peter Korsgaard

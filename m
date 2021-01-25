From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Jan 2021 20:28:51 +0100
Subject: [Buildroot] Porting a vendor specific yocto layer to the
 buildroot
In-Reply-To: <1611562430908-0.post@n4.nabble.com> (scdrj's message of "Mon, 25
 Jan 2021 02:13:50 -0600 (CST)")
References: <1611562430908-0.post@n4.nabble.com>
Message-ID: <877do07r4c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "scdrj" == scdrj  <scdrjcom@gmail.com> writes:

 > How do I port a vendor specific yocto layer to the buildroot?

One step at a time?

No seriously, it is hard to know without knowing what that layer
does. You will need to have a look at everything it does and add
packages and rootfs overlays / post-build scripts to do the same thing
in Buildroot.

-- 
Bye, Peter Korsgaard

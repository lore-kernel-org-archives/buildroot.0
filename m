From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Dec 2016 15:23:49 +0100
Subject: [Buildroot] [PATCH 1/2] dovecot: bump version to 2.2.27
 (security)
In-Reply-To: <20161210152302.07885776@free-electrons.com>
References: <20161209151003.49165-1-Vincent.Riera@imgtec.com>
 <20161210152302.07885776@free-electrons.com>
Message-ID: <20161210152349.3bec5dd4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 10 Dec 2016 15:23:02 +0100, Thomas Petazzoni wrote:

> Basically, dovecot no longer builds without OpenSSL support. The
> configure error can be fixed by adding the attached patch (+ a
> host-gettext dependency + autoreconf + creating m4). But then, the
> build fails with:

Now with the patch attached.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-configure.ac-AM_CONDITIONAL-should-not-be-inside-a-c.patch
Type: text/x-patch
Size: 1644 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161210/452d12bd/attachment.bin>

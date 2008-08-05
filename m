From: Wade Berrier <wberrier@gmail.com>
Date: Tue, 5 Aug 2008 13:44:50 -0600
Subject: [Buildroot] [PATCH] Remove readline for which
Message-ID: <bbbeeccd0808051244k582789fdtae270bde1ac4aa1b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've patched 'which' to not require readline on the source level
instead of selecting it on the buildroot dependency level.

Patch attached.

Wade
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-which_no_readline.patch
Type: text/x-diff
Size: 937 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080805/72ac59e8/attachment.patch 

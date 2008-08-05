From: Wade Berrier <wberrier@gmail.com>
Date: Tue, 5 Aug 2008 08:26:11 -0600
Subject: [Buildroot] [PATCH] Samba: mmap & fcntl checks
In-Reply-To: <bbbeeccd0807250848w3849113cv71ad67f7cebc0acf@mail.gmail.com>
References: <bbbeeccd0807250848w3849113cv71ad67f7cebc0acf@mail.gmail.com>
Message-ID: <bbbeeccd0808050726y1780ef03oe4d2785457f5f008@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here's an updated patch that also adds support for including the
smbtar and findsmb scripts.

Wade

2008/7/25 Wade Berrier <wberrier@gmail.com>:
> Hi,
>
> Here's a patch that adds hard checks for mmap and fcntl.  It makes
> samba perform better.
>
> (Also is included in the init.d script to create /var/lock/subsys
> which it refers to).
>
> Wade
>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-samba_add_autoconf_checks_and_scripts.patch
Type: text/x-diff
Size: 3058 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080805/227e8bc3/attachment.patch 

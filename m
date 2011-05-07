From: Cam Hutchison <cam@camh.ch>
Date: Sat, 07 May 2011 06:54:20 -0000
Subject: [Buildroot] Fetching linux kernel source with git
Message-ID: <778f.4dc4ec9c.697dc@getafix.xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Is it possible to tell buildroot to get the linux kernel source from a
git repository?

I had a look in linux/linux.mk and it does not look like it uses the
package infrastructure for specifying the source and download methods,
but I thought I'd check here in case I missed something.

I have a local kernel git repository and I'd rather buildroot pull from
that than download specific version tarballs.

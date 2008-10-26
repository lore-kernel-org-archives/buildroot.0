From: Thomas Lundquist <lists@zelow.no>
Date: Sun, 26 Oct 2008 12:43:58 +0100
Subject: [Buildroot] if !defined
Message-ID: <20081026114358.GA14465@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi.

I am messing with grub right now and using gcc 4.2.4 I end up with a problem with this:

#if !defined __UCLIBC__ || (defined __UCLIBC__ && defined __UCLIBC_HAS_LFS__)

__UCLIBC_HAS_LFS__ is not defined and __UCLIBC__ is  but it still kicks in.

Anyone seen this lately?

(vsftpd seems to just work with the same line)


Thomas.

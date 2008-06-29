From: Fathi Boudra <fboudra@gmail.com>
Date: Sun, 29 Jun 2008 16:25:37 +0200
Subject: [Buildroot] Add libcap/elfutils/systemtap to buildroot
In-Reply-To: <200806282211.26259.fboudra@gmail.com>
References: <200806190804.50624.fboudra@gmail.com>
	<200806282211.26259.fboudra@gmail.com>
Message-ID: <200806291625.38583.fboudra@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday 28 June 2008 22:11:23 Fathi Boudra wrote:
> Now, I have another failure: argp.h not found.
> AFAICS, it is glibc specific and again, uClibc doesn't provide it.
> I guess the way to go is argp-standalone ?

Well, using argp-standalone fixed this issue.

new failure: fts.h not found.
Same kind of issue, it is glibc specific and uClibc doesn't provide it.

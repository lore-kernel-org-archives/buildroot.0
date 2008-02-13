From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 14 Feb 2008 10:42:03 +1100
Subject: [Buildroot] binutils ftbfs on x86_amd64 host
In-Reply-To: <6a2e33620802131426g4ef22451k8f0a9e80e7ad0ba8@mail.gmail.com>
References: <6a2e33620802131426g4ef22451k8f0a9e80e7ad0ba8@mail.gmail.com>
Message-ID: <20080213234203.GC30407@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Feb 13, 2008 at 11:26:21PM +0100, Fathi Boudra wrote:
> using latest buildroot to build an uClibc cross-compiler toolchain,
> I have a ftbfs at binutils stage. Same results with 2.18 and 2.18.50.0.1.
> My host is a Debian Sid amd64. Any ideas how to fix ?

What's your target? Maybe you can post your .config. I use an amd64 host
here building for armeb without issue.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>

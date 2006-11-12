From: Thomas Lundquist <lists@zelow.no>
Date: Sun, 12 Nov 2006 10:47:59 +0100
Subject: [Buildroot] make from scratch bugs..
In-Reply-To: <20061105113957.GA14530@zelow.no>
References: <20061105091300.GA11317@zelow.no> <20061105113957.GA14530@zelow.no>
Message-ID: <20061112094759.GA26518@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Nov 05, 2006 at 12:39:57PM +0100, Thomas Lundquist wrote:
> 
> no problem with kernel headers 2.6.12.

It's the script fix_includes.sh in extra/scripts that doesen't
understand the new versioning. I just copied the script from the latest
uClibc snapshot and it seemed to work.

(so, it's a sortof uClibc "bug" I guess.)


Thomas.

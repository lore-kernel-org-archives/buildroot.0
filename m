From: =?utf-8?B?U8O4cmVuc2VuLCBTdGVmYW4=?= <Stefan.Sorensen@spectralink.com>
Date: Wed, 6 Feb 2019 15:27:52 +0000
Subject: [Buildroot] [RFC PATCH 1/2] annobin: New package
In-Reply-To: <20190206160450.0b2a899c@windsurf>
References: <20180503143147.5301-1-stefan.sorensen@spectralink.com>
 <20180503143147.5301-2-stefan.sorensen@spectralink.com>
 <20190206160450.0b2a899c@windsurf>
Message-ID: <62ae845de2ae3fe09dbdb9c0cc00cddd92e86362.camel@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2019-02-06 at 16:04 +0100, Thomas Petazzoni wrote:

> This one is already in Buildroot, and is a lot easier to integrate
> than a gcc plugin. So unless you see an issue with checksec that is
> solved by annobin, we'll probably stick to using checksec.

The issue with checksec is that is only checks if *some* of the code in
the binary is compiled with the correct security options - it does not
detect that the correct options has not been used for compiling all of
the code.

Unfortunately I do not have any time right now to spend on this, but I
hope that I will be able to update this to a more recent annobin relase
soon.


Stefan

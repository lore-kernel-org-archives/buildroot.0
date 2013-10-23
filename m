From: arnaud aujon <arnaud.aujon@gmail.com>
Date: Wed, 23 Oct 2013 17:43:15 +0200
Subject: [Buildroot] Tool to check packages updates
In-Reply-To: <CAAXf6LW1c32E_BFwbD6JKMCRKWtCw4r7pc9xuj3_DPsGyjL=SA@mail.gmail.com>
References: <CACjG4BJq5TXvpMAoU7w3JgTVrOGHpeKng88HU03Rf_=XunPKAQ@mail.gmail.com>
 <CAAXf6LW1c32E_BFwbD6JKMCRKWtCw4r7pc9xuj3_DPsGyjL=SA@mail.gmail.com>
Message-ID: <CACjG4B+7riHKmXG0Oo3cZxrWFygTBojSTHRktuYvz0eeMJ0ttQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Both Thomas,

2013/10/23 Thomas De Schampheleire <patrickdepinguin@gmail.com>

>
>
> The autobuild server seems to have a different package count:
> http://autobuild.buildroot.org/stats/
>
> Packages using the generic infrastructure 306
> Packages using the cmake infrastructure 19
> Packages using the autotools infrastructure 807
> Packages not using any infrastructure 0
>
> Since your script only sees 837 packages, I think you may be missing
> some, unless the difference is only due to the duplicate counting of
> host and target packages...
>
>
>
You're right, my count isn't accurate, I intentionally skip some packages
that are not well handled by the script. The other difference is as you
said, I only count target packages.

Please post your script when you
> think it's ok, but don't wait to much: the earlier the better, so that
> you can get early feedback, and maybe help/testing from others.


I will do it as soon as possible, but I want to make it easy to read first.
As I'm far to be a python expert, it will take me some time to get used to
the right way to code in python.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131023/f36d10cf/attachment.html>

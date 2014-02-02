From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 2 Feb 2014 12:14:35 +0100
Subject: [Buildroot] Patch for toolchainfile.cmake absolut path
	references
In-Reply-To: <52ECDB01.5070306@googlemail.com>
References: <52ECDB01.5070306@googlemail.com>
Message-ID: <CAHXCMM+3EFDcnL-K5FzuDw1Xs-eThD_yJ4rEP1L7HopmqhMpug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Uwe,

On Sat, Feb 1, 2014 at 12:31 PM, Uwe Strempel <u.strempel@googlemail.com>wrote:

> Hi,
> I've build a patch for BUG #6818
>
> FIrst, thanks for your contribution, but please consider a patch using git,
and send it to the mailing list using 'git send-email' (see
http://www.buildroot.org/downloads/manual/manual.html#_contributing_to_buildroot
),
this is the way Buildroot community works.

Anyway, I looked at the patch.


> On build process of buildroot the toolchainfile.cmake is created, but
> with wrong absolut path.
> When shareing the toolchain or move the folder you get problems this
> path settings.
>
> A workarround for cmake files is
> - get the path of the toolchainfile.cmake and set the the variables.
>
>
I found the part touching the package/Makefile.in a bit confusing.
The idea of what has to be done in the toolchainfile.cmake is good, though
I think you miss some $-escaping...


Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140202/dfb329ae/attachment.html>

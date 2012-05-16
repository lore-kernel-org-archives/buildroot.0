From: Ron Eggler <reggler@semiosbio.com>
Date: Wed, 16 May 2012 11:33:39 -0700
Subject: [Buildroot] (newbie question)
In-Reply-To: <4FB2D92E.9030905@mind.be>
References: <CAFC29aU6nfLkHpbs1mKhV13aVdtskqtKtCpURpzi-gQErviriQ@mail.gmail.com>
 <20120515224254.6bff263a@skate>
 <CAFC29aUwvGS-tsbLiCe7=7W1HZ0UZ409BMhf5Y73r289FSuNUA@mail.gmail.com>
 <4FB2CADD.9040001@mind.be>
 <CAFC29aVzYKupB7RKHOL1kiUOC6C=ySGdO9XzGvG5FAvo4pnLkw@mail.gmail.com>
 <4FB2D92E.9030905@mind.be>
Message-ID: <CAFC29aXHt7pqDojsYLRHhrwReZOTny84S1zUZo5YNqYSLe3C1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 15, 2012 at 3:31 PM, Arnout Vandecappelle <arnout@mind.be>wrote:

>  Hoi Ron,
>
>  There are a lot of small mistakes here, one of which is deadly :-)
>
>  If you could fix these mistakes, we could accept your contributions in
> buildroot.  For that, you need to do a few things:
>
> - Create a proper patch, separate for each package.  A proper patch has a
> commit
> message, followed by ---, followed by the patch.
>
> - The commit message for a new package should be something like 'gd: new
> package'.
>
> - Add a Signed-off-by line for yourself in the commit message.  This is a
> short
> way for you to  assert that you are entitled to contribute the patch under
> buildroot's  GPL license.  See  http://kerneltrap.org/files/**
> Jeremy/DCO.txt <http://kerneltrap.org/files/Jeremy/DCO.txt> for
> more  details.
>
> - Make sure the patch is sent in-line (not as attachment), tabs are
> preserved and
> lines are not split.  The easiest way to make sure of all this is to
> commit your
> changes into git and use 'git send-email' to send the patch.
>

Hi Arnout,

Okay so I retried this, this time with another iteration of my buildroot
directory.
I attempted to add the weex driver that depends on
python-configobj
python-serial (already present)
python-cheetah
python-imaging
so I added the required files, compiled and guess what, it's not working. I
suspect that I did the same mistake as at my first try. Here are the diff
files (see attached). (I hope I did it correctly now, if not, let me know!)

Thank you,
Ron
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120516/7d85f3d4/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: Config.in (python-cheetah)
Type: application/octet-stream
Size: 608 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120516/7d85f3d4/attachment-0009.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: Config.in (python-configobj)
Type: application/octet-stream
Size: 609 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120516/7d85f3d4/attachment-0010.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: Config.in (weewx)
Type: application/octet-stream
Size: 585 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120516/7d85f3d4/attachment-0011.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: Config.in(python-imaging)
Type: application/octet-stream
Size: 576 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120516/7d85f3d4/attachment-0012.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: python-cheetah.mk
Type: application/octet-stream
Size: 1044 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120516/7d85f3d4/attachment-0013.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: python-configobj.mk
Type: application/octet-stream
Size: 1075 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120516/7d85f3d4/attachment-0014.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: python-imaging.mk
Type: application/octet-stream
Size: 990 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120516/7d85f3d4/attachment-0015.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: toolchainfile.cmake
Type: application/octet-stream
Size: 1352 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120516/7d85f3d4/attachment-0016.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: weewx.mk
Type: application/octet-stream
Size: 959 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120516/7d85f3d4/attachment-0017.obj>

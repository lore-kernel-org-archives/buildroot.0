From: Thomas Lundquist <lists@zelow.no>
Date: Wed, 19 Sep 2007 08:42:00 +0200
Subject: [Buildroot] buildroot with ipkg
In-Reply-To: <46EEEEE2.7060705@free.fr>
References: <7fc538d30709170509s4898cc55keb14ebb718d30090@mail.gmail.com>
	<46EED912.2070902@free.fr> <20070917201401.GA28671@codepoet.org>
	<46EEEEE2.7060705@free.fr>
Message-ID: <20070919064200.GA29317@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 17, 2007 at 11:17:22PM +0200, Julien Boibessot wrote:

> Do you think it's possible to do that without modifying all the 
> Buildroot packages makefiles ?

No, it need that work.

I've attatched the last svn diff I made, which is kinda outdated. This
makes tarballs and very simple .debs. I was about to do ipkg when work
caught up with me.

It will not apply cleanly to the newest svn but I feel I should at least
show that I have something. It should be fairly easy to hack in but I
have to finish the project I work on now before I can play with this.

The concept is that you can choose what kind of packages you want and
then choose between package or "base" for every package in packages/
(the only package that you can do with it right now is Dropbear, as a
proof of concept.)

If you are in a hurry, feel free to fix and add, if not I'll try to
finish up a new patch in a week or two (I've said that before but if I
know I can add it to buildroot I'm more motivated for it.)



Thomas.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: brpack.patch
Type: text/x-diff
Size: 11696 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070919/f7e0894c/attachment-0001.bin 

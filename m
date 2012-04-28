From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Sat, 28 Apr 2012 13:15:05 +0200
Subject: [Buildroot] How do you add to library path?
In-Reply-To: <201204280544.24157.minimod@morethan.org>
References: <jnc1d9$t1p$1@dough.gmane.org> <201204280018.27254.arnout@mind.be>
 <201204280544.24157.minimod@morethan.org>
Message-ID: <CAC1BbcTQVqrFCwCz4_kSnUtHuKVB4Diw4H7iR+N=XyNFKjg_mA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

There is chpath (sp?) to change the rpath later on.
This is something completely different to turning on ld.so.cache support,
though.

HTH,

On 28 Apr 2012 12:44, "Michael S. Zick" <minimod@morethan.org> wrote:

On Fri April 27 2012, Arnout Vandecappelle wrote:
> On Thursday 26 April 2012 19:42:01 Grant Edwards...
At a guess (untried by myself), it might be possible to use objcopy to
add/change the rpath information __after__ the build is otherwise complete.

I.E: For the case where the rpath information added is for the target's use,
rather than the build host's use.

I do not know for certain if objcopy can access or change the rpath
information field in an object, I have never seen or read about it being
done.

Mike

>  Regards,
>  Arnout

>


_______________________________________________
buildroot mailing list
buildroot at busybox.net
ht...
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120428/67fca940/attachment.html>

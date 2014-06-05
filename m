From: Dallas Clement <dallas.a.clement@gmail.com>
Date: Thu, 5 Jun 2014 11:34:41 -0500
Subject: [Buildroot] autoconf caching
Message-ID: <CAE9DZUT8+z0NF5O6sh=y4svCfQW0bh1Zt4r7OM9fe9nYvk-O0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All - I have seen posts on this subject before.  It looks like things
flamed out.

http://lists.gnu.org/archive/html/autoconf/2012-11/msg00022.html

I'm getting killed by autoconf.  My builds take 1.5 hours even with ccache
turned on.  Most of the cores in my very impressive build machine are
sitting on their !#@ while autoconf is running.  Most of my packages rely
on autotools and it seems that most of the time spent is running configure
scripts.

Can anyone offer some advice on how to speed things up with autoconf?  Or
is it a lost cause?

Many thanks,

Dallas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140605/043255ef/attachment.html>

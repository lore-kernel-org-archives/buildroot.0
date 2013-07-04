From: Phil Eichinger <phil.eichinger@gmail.com>
Date: Thu, 4 Jul 2013 11:02:19 +0200
Subject: [Buildroot] About Code Sourcery and Crosstool-NG
In-Reply-To: <20130704084057.GA24592@zuhnb712.ap.bm.net>
References: <20130704084057.GA24592@zuhnb712.ap.bm.net>
Message-ID: <CAPiYbRKt1k6seCMSvBxTRS7+iG-9WMeS5SrrTco7wApShZKnEQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 4 July 2013 10:40, Woody Wu <narkewoody@gmail.com> wrote:

> Hi,
>
> When the online manul talks about external toolchain, it mentiond
> crosstool-NG.  But when I firstly open the 2013.05 buildroot, I found
> there is no crosstool-NG in the options at all, but I found Code
> Sourcery ARM.
>

crosstool-NG support is deprecated, check the CHANGES file.
You can still activate the option by checking "Show packages that are
deprecated or obsolete" under "Build options", but YMMV.
I used an external crosstool-NG install to generate my toolchain and used
that within Buildroot.

Cheers, Phil
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130704/230e7fb4/attachment.html>

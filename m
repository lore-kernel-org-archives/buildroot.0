From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 21 Jul 2017 18:23:17 +0300
Subject: [Buildroot] [PATCH 1/1] webkitgtk: bump to version 2.16.5
In-Reply-To: <871spb63sv.fsf@dell.be.48ers.dk>
References: <20170705143303.26282-1-aperez@igalia.com>
 <87o9sg8qu7.fsf@dell.be.48ers.dk> <871spb63sv.fsf@dell.be.48ers.dk>
Message-ID: <20170721182317.GB14021@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Thu, 20 Jul 2017 08:05:52 +0200, Peter Korsgaard <peter@korsgaard.com> wrote:
> >>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
> 
> >>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:
>  >> This simply updates to the latest stable release. WebKitGTK+ versions
>  >> in the 2.1x series avoid bumping the dependencies in order to allow
>  >> distributions to provide updates, therefore no new dependencies are
>  >> needed.
> 
>  >> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> 
>  > Committed to 2017.02.x and 2017.05.x, thanks.
> 
> While backporting I noticed that webkitgtk doesn't seem to build without
> the BR2_PACKAGE_WEBKITGTK_MULTIMEDIA option. I reproduced it with master
> as well.
> 
> The build error I get is this. Do you have any idea how to fix?

WebKitGTK+ does not officially support compiling with non-default build
options, but we try to keep the existing options working. Either we haven't
noticed this breakage, or there is some good reason why multimedia support
can't be disabled -- but my guess is the former.

At any rate, thanks a lot for the heads up. I'll try and take a look next week
when I'm back from holidays.

Cheers,


--
 Adri?n ?

-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170721/78b89384/attachment.asc>

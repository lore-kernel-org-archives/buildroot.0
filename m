From: Michael Sumulong <msumulong@gmail.com>
Date: Wed, 26 Nov 2014 17:01:26 -0500
Subject: [Buildroot] Patch a buildroot package's libfoo.mk file?
In-Reply-To: <87zjbkntby.fsf@dell.be.48ers.dk>
References: <CABDNR163vv83d7tvOwdQoOs1AGnycts0mNde_fzvHmHvy68+YQ@mail.gmail.com>
 <87zjbkntby.fsf@dell.be.48ers.dk>
Message-ID: <CABDNR14q-FC6CCukKM7Oi_W3UPjFBQdFz3RGDFO6JJNTa4iHKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Works great. Thanks!

On Fri, Nov 21, 2014 at 4:21 PM, Peter Korsgaard <peter@korsgaard.com>
wrote:

> >>>>> "Michael" == Michael Sumulong <msumulong@gmail.com> writes:
>
>  > I am using the avahi package that comes with buildroot but there's a
>  > configuration option that I'd like to use (--enable-compat-libdns_sd)
> that
>  > I don't think the whole buildroot community would need. Is it possible
> to
>  > apply a patch from a source dir (BR2_EXTERNAL) to package/avahi/
> avahi.mk
>  > using buildroot patching framework?
>
> Please give Buildroot 2014.11-rc2 a try. I've added an option for the
> libdns-sd compat handling during the 2014.11 cycle
> (BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY).
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141126/eb5dfbeb/attachment.html>

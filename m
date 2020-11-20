From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 20 Nov 2020 18:22:55 +0200
Subject: [Buildroot] [PATCH v1] package/wpewebkit: fix compile without
 video support
In-Reply-To: <87y2j17bk6.fsf@dell.be.48ers.dk>
References: <20201110221629.7011-1-ps.report@gmx.net>
 <87sg9ei86d.fsf@dell.be.48ers.dk> <20201112223734.007ff25d@gmx.net>
 <20201113235046.GB184214@momiji> <87ima8cqcf.fsf@dell.be.48ers.dk>
 <20201114162730.GD203851@momiji> <20201116131935.GB245193@momiji>
 <87y2j17bk6.fsf@dell.be.48ers.dk>
Message-ID: <20201120182255.GB157634@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 16 Nov 2020 13:04:09 +0100 Peter Korsgaard <peter@korsgaard.com> wrote:
> >>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:
> 
> Hi,
> 
>  >> The person in charge of the WebKitGTK releases and myself (for WPE WebKit)
>  >> have been talking about when to make the new releases happen, and it's likely
>  >> that we will put out the tarballs and an accompanying WSA by Friday 20th.
>  >> If, for some reason, that cannot happen in the end, I will add submit this
>  >> patch to be included in the Buildroot release instead of the version bump.
> 
>  > Confirmed, we will have new releases of WebKitGTK and WPE WebKit by the end
>  > of this week. I'll submit patches to update the Buildroot packages as soon as
>  > the releases are out.
> 
> Great, thanks!

Done, here's the patches to update both WebKitGTK and WPE WebKit to 2.30.3:

  https://patchwork.ozlabs.org/project/buildroot/patch/20201120161937.222193-1-aperez at igalia.com/
  https://patchwork.ozlabs.org/project/buildroot/patch/20201120161918.222066-1-aperez at igalia.com/

There will be a security advisory covering these releases, but it is still
going to take a day or two to have it online.

Cheers,
?Adri?n
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201120/8324a0be/attachment.asc>

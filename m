From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Thu, 25 Jan 2018 00:34:04 +0100
Subject: [Buildroot] Broken link in build notification
In-Reply-To: <87po61o9q2.fsf@dell.be.48ers.dk>
References: <20180121070008.0687520885@mail.free-electrons.com>
 <7d2636ad-5201-10d9-fe72-4d1001a94c72@gmail.com>
 <87po61o9q2.fsf@dell.be.48ers.dk>
Message-ID: <315211c8-1831-557c-4ef0-00d67fd8473a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Dear Peter,

On 01/22/2018 10:38 PM, Peter Korsgaard wrote:
>>>>>> "Zoltan" == Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com> writes:
>  > Dear Thomas &All,
>  > On 01/21/2018 08:00 AM, Thomas Petazzoni wrote:
>  >> Hello,
>  >> 
>  >> This is the list of Buildroot build failures that occured on
>  >> 2018-01-20, and for which you are a registered architecture developer
>  >> or package developer. Please help us improving the quality of
>  >> Buildroot by investigating those build failures and sending patches to
>  >> fix them. Thanks!
>  >> 
>  >> Results for the 'master' branch
>  >> ===============================
>  >> 
>  >> Build failures related to your packages:
>  >> 
>  >> arm | proj-4.9.3 |
>  >> http://autobuild.buildroot.net/results/80243a2ae19190d75e84a2ed8aa4b95a20ea9ef0
>  >> 
>
>  > I received this ^^ build error notification mail yesterday.
>
>  > The link redirects to
>  > https://bugs.busybox.net/results/80243a2ae19190d75e84a2ed8aa4b95a20ea9ef0,
>  > and ends up in a 404.
>
> Sorry, my fault. I am moving sources.buildroot.net to a new VM / behind
> cloudflare, and DNS for autobuild.buildroot.net temporarily pointed at
> the VM running bugs.busybox.net instead of the autobuild master.
OK, thanks for the clarification.

> There's also a few autobuilder failures because of this.

I couldn't reproduce the linked build failure, so you think it's
probably because of this and it's safe to ignore?
>
> It should be fixed now, and sources.buildroot.net should be faster now.
>

Cool, thanks for the work on this!

Regards,


Zoltan Gyarmati
https://zgyarmati.de


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180125/e605cc4d/attachment.asc>

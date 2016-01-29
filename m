From: Phil Eichinger <phil.eichinger@gmail.com>
Date: Fri, 29 Jan 2016 14:10:27 +0100
Subject: [Buildroot] [PATCH 1/1] gstreamer1: use a relative symlink to
	gstconfig.h
In-Reply-To: <871t91prte.fsf@dell.be.48ers.dk>
References: <1453987198-26052-1-git-send-email-phil@zankapfel.net>
 <871t91prte.fsf@dell.be.48ers.dk>
Message-ID: <CAPiYbRKfZ6w-ih6A1EyZegvcU01uee9Wk=7uK8-bj7A88su9jQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28 January 2016 at 17:55, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Phil" == Phil Eichinger <phil.eichinger@gmail.com> writes:
>
>  > Signed-off-by: Phil Eichinger <phil@zankapfel.net>
>
> Why? Does that fix anything or is it just "prettier"? I get it that we
> would need it for a relocatable host dir, but we're not there yet.
>
> A bit more detailed commit message would be good.
>

Yes, it is for relocation, sorry for not being more elaborate on that, will
do better in the future.

I actually relocate the host dir with some tricks, that aren't upstreamable
yet because they are not generally usable for buildroot.
This patch just eases the relocation and I didn't see any harm in using a
relative symlink instead of an absolute one.
So it actually fixes something, it's not just "prettier"
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160129/d1e910ae/attachment.html>

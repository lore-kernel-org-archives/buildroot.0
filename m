From: Mau Z <zmau1962@gmail.com>
Date: Thu, 9 Jan 2014 13:56:08 +0200
Subject: [Buildroot] How to suspend to RAM (S3) on the target
In-Reply-To: <CAPFcPTJHyVEXosmFspxbAnPZN=LiD9Ne2UxmNcujK7PaXqtCnw@mail.gmail.com>
References: <CAPFcPTJ8i1o1qoZFpjpV6Un3psR8LORtq4tXnUcMXtagdZU3RQ@mail.gmail.com>
 <CAPFcPTKCVvQd1W7_XrQ0tJZTTi_uREYBLpJJ_Too3Gm1XaJaKg@mail.gmail.com>
 <CALR4fELa0SDGawJDnj5uPqdzYQQt3qE_4-8qOTjQvAGqbXur9Q@mail.gmail.com>
 <CAPFcPTJHyVEXosmFspxbAnPZN=LiD9Ne2UxmNcujK7PaXqtCnw@mail.gmail.com>
Message-ID: <CAPFcPTKGJhjR4pM9=JZGWyN+ZFT4B5JFtayzt1i1-ar9CTbZYw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I forgot to put the link :
http://comments.gmane.org/gmane.comp.lib.uclibc.buildroot/69659



On Thu, Jan 9, 2014 at 1:55 PM, Mau Z <zmau1962@gmail.com> wrote:

> Hi,
>
> 1) Read the following link to understand why I asked to skip the question.
> 2) The solution is
>
> echo "mem" > /sys/power/state
>
> BUT, in order for this to work, you need the support of the
> BIOS/hardware/firmware (and I did not have this at the time).
>
> If you want, I can say some more things about this issue (but I think that
> it is relevant only for newbies).
>
>
>
> Thanks
> Mau
>
>
>
> On Tue, Jan 7, 2014 at 1:21 PM, Diego Iastrubni <diegoiast@gmail.com>wrote:
>
>> On Mon, Jan 6, 2014 at 7:15 PM, Mau Z <zmau1962@gmail.com> wrote:
>> >
>> > Skip the question please.
>> >
>> Found the solution? Why not sharing the solution?
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140109/661e4b25/attachment.html>

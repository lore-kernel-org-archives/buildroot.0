From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 2 Nov 2013 19:04:26 +0100
Subject: [Buildroot] github tarball urls: http vs https
In-Reply-To: <52753AB6.20904@trzebnica.net>
References: <CAAXf6LUToDknEUmXgK-z2LkXG6oxZ9-0WwNfq6Ub_w7Lq_TjHQ@mail.gmail.com>
 <52753AB6.20904@trzebnica.net>
Message-ID: <CAAXf6LUsvpTG1-tNk5aWgR5qNgBYFu0h6a50VkrZ3r4YVviCxQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jerzy, Arnout, all,

On Sat, Nov 2, 2013 at 6:47 PM, Jerzy Grzegorek
<jerzy.grzegorek@trzebnica.net> wrote:
[..]
>> Packages that are hosted on github and downloaded with the tarball
>> method, can either have a http or https URL. It seems that a download
>> from http is redirected to the corresponding https URL. To avoid such
>> an unnecessary redirect, we could update all github .mk files to use
>> https directly.
>>
>> I vaguely recall a discussion on the mailing list about this, but I
>> don't know what the outcome was. Was there a problem using the https
>> URLs with respect to certificates?
>
>
> It was my proposal.
> Please look here:
> http://lists.busybox.net/pipermail/buildroot/2013-October/079209.html
>

Thanks for the link. However, besides a comment from Arnout, the
discussion was more about the VERSION part rather than the URL itself.

Arnout, in that thread you wrote:
"Also you change the URL to https here. With the recent problems with
https URLs that we've seen on the autobuilders recently, I wonder if this
is a good idea?"

Could you clarify what problems you were talking about?

Thanks,
Thomas

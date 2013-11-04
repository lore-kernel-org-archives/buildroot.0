From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 4 Nov 2013 09:33:49 +0100
Subject: [Buildroot] github tarball urls: http vs https
In-Reply-To: <527742F3.6070405@mind.be>
References: <CAAXf6LUToDknEUmXgK-z2LkXG6oxZ9-0WwNfq6Ub_w7Lq_TjHQ@mail.gmail.com>
 <52753AB6.20904@trzebnica.net>
 <CAAXf6LUsvpTG1-tNk5aWgR5qNgBYFu0h6a50VkrZ3r4YVviCxQ@mail.gmail.com>
 <527742F3.6070405@mind.be>
Message-ID: <CAAXf6LVNCTivN=SwA7YzCzrN7QPxBsDXVG3kvLecmnswmSzqNw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Mon, Nov 4, 2013 at 7:47 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 02/11/13 19:04, Thomas De Schampheleire wrote:
[..]
>> Arnout, in that thread you wrote:
>> "Also you change the URL to https here. With the recent problems with
>> https URLs that we've seen on the autobuilders recently, I wonder if this
>> is a good idea?"
>
>
>  First of all: I didn't realize that the http URL just redirects to an https
> URL. In that case, obviously, using the https URL is better.
>
>
>>
>> Could you clarify what problems you were talking about?
>
>
>  IIRC, at some point there was a problem that a download site used a
> certificate signed by a recent CA that was not included in the autobuilder's
> trusted certificate list, so wget would not accept it. It was discussed that
> an option was to run wget with --no-check-certificate, but this would defeat
> the purpose of https so was rejected. Of course, using an http URL instead
> of an https has the same result.

But this seems to be a temporary problem only.
Besides, what happens in that scenario if you try http, and the server
redirects it to https? I would expect the certificate to fail, or does
wget pass an implicit --no-check-certificate in this case?

Best regards,
Thomas

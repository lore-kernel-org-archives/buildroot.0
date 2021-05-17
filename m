From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 May 2021 19:29:18 +0200
Subject: [Buildroot] [PATCH] package/pybind11: new package
In-Reply-To: <CAJe0E3cf7CCqaZz2UTCjTj-qHE_zSbnXzsZTt_k91CWeTepGqw@mail.gmail.com>
References: <20210227100959.28281-1-guillaume.bressaix@gmail.com>
 <d5246e4f-57be-f80e-674f-544519627684@mind.be>
 <CAJe0E3cf7CCqaZz2UTCjTj-qHE_zSbnXzsZTt_k91CWeTepGqw@mail.gmail.com>
Message-ID: <51050cf9-78ad-668e-d257-d22cd2252a53@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/05/2021 15:50, Guillaume Bres wrote:
> Arnout,
> 
> thank you for the patch review,
> I am working on total different things but will soon get back to this topic
> 
>>I went back to that patch and commented on it. It indeed looks like a better
> approach?
> 
> Yes, it would allow any use case of "pybind" and would unlock
> the?impossibility?to upgrade at the moment
> 
>> It would be good to also add a patch that removes python-pybind then. For that
>> patch, don't forget to add a conversion in Config.in.legacy.
> 
> I never had to do that, I'll try my best.
> Which version of BR should I mention in "removed in xxx"??
> I assume the next release, so that means I should push my patch to ->next??

 Yes, please prepare your patch for the `next` branch. There should be a

comment "Legacy options removed in 2021.08"

added. But don't worry too much about it, we'll fix that while applying if needed.

 Regards,
 Arnout

[snip]

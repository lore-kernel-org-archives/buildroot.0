From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Tue, 16 Dec 2014 08:00:49 -0500
Subject: [Buildroot] [git commit] erlang: use libatomic_ops if available
In-Reply-To: <20141216134551.75ca7975@free-electrons.com>
References: <20141215215003.A758F80403@busybox.osuosl.org>
 <20141216132618.5c19cb84@free-electrons.com>
 <8761dbkbr6.fsf@dell.be.48ers.dk> <20141216134551.75ca7975@free-electrons.com>
Message-ID: <CA+-urNR+0mXYspMzrKeBErGuEcsQLt5WYkJv-8vaTbZ-F8g3ww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas and Peter,

On Tue, Dec 16, 2014 at 7:45 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Peter Korsgaard,
>
> On Tue, 16 Dec 2014 13:41:33 +0100, Peter Korsgaard wrote:
>
>>  > Is this really what we want to do? In such cases, we normally always
>>  > force to use the "system" version of the library rather than the
>>  > built-in one. Why should Erlang be treated differently, especially if
>>  > using the "system" version of the library works fine?
>>
>> So in other words, make erlang select libatomic_ops? That sounds fine to
>> me.
>
> Yes, that's what I meant: make erlang select libatomic_ops.

This sounds good to me as well. I'll fix it shortly.

Thanks,
Frank

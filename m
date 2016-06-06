From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Mon, 6 Jun 2016 13:24:29 -0300
Subject: [Buildroot] [PATCH 1/2] beaglebone: Use default U-Boot version
In-Reply-To: <20160605215448.GA3832@free.fr>
References: <1465075749-31837-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20160605095211.48d06937@free-electrons.com>
 <20160605215448.GA3832@free.fr>
Message-ID: <CAAEAJfB5CNiyRcfhvJO--eQJzEFMUeHwxvQ6aKd4zvGUQAEJ1A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 5 June 2016 at 18:54, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas, Ezequiel, All,
>
> On 2016-06-05 09:52 +0200, Thomas Petazzoni spake thusly:
>> On Sat,  4 Jun 2016 18:29:08 -0300, Ezequiel Garcia wrote:
>> > There's no reason to use a specific U-Boot version, given
>> > we are using upstream. Leave the default version get selected.
>> >
>> > Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>>
>> No, that's not our policy. Our policy is to use a fixed version (even
>> if an upstream one) to make sure that people using the defconfig in the
>> future will have a known-working version.
>
> That may be my fault: we've discussed this with Ezequiel on IRC, and
> from what I understood, it looked he was askign why we were not using an
> upstream version.
>
> So, I replied that we can use upstream, of course, if upstream has the
> necessary support.
>
> Maybe I was not clear enough: we can use upstream, but a fixed version,
> of course.
>
> If 2013.10 is too old, you can bump (e.g. to 2015.10 or whatever, even a
> sha1 from the git tree if necessary). But that should be a fixed
> version, indeed.
>
> Sorry for the confusion... :-/
>

No problem, no need for apologies :-)

I'll cook a new patch in no time.
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar

From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 10 Nov 2011 20:40:03 +0100
Subject: [Buildroot] [RFC] Making clear that Buildroot is no longer
	uClibc specific
In-Reply-To: <CAAXf6LV5TPv9Q93m0ju4=16FRfNkfRebJ5pb=+qXVRcqaWisQg@mail.gmail.com>
References: <cover.1318343868.git.thomas.petazzoni@free-electrons.com>
 <CAAXf6LV5TPv9Q93m0ju4=16FRfNkfRebJ5pb=+qXVRcqaWisQg@mail.gmail.com>
Message-ID: <CAAXf6LWvU8ZMwQMZH=UxhDxjXQHWma_GzoahvSr+jYDVDWxA2g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Oct 13, 2011 at 5:40 PM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> Hi,
>
> On Tue, Oct 11, 2011 at 4:38 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Hello,
>>
>> Historically, the Buildroot project was started by uClibc
>> developers. Nowadays, Buildroot can be used regardless of the choice
>> of C library, but many people still think it's an uClibc-only
>> solution.
>>
>> Therefore, the following patch proposed to switch to a dedicated
>> #buildroot IRC channel instead of #uclibc.
>>
>> In addition to that, it'd be great if the mailing-list had
>> buildroot at buildroot.org as its official address, and if the bug
>> tracker had http://bugs.buildroot.org as its official address.
>>
>> What do you think?
>
> I'm all in favor!
> This also would render the busybox.net mailing list alias redundant (I
> always found it confusing that busybox used .net and uclibc and
> buildroot used .org)

Is there anything in progress regarding this?
The IRC channel is already changed. What about the bug tracker and
mailing list? Is this something that simply needs to be requested, or
is there much more to it than that?

>>
>> The following changes since commit bde4564fa74cc25a088aa4173709894d2acf5844:
>>
>> ?radvd: show it in config menu when toolchain lacks ipv6 (2011-10-11 16:10:30 +0200)
>>
>> are available in the git repository at:
>> ?http://free-electrons.com/~thomas/buildroot.git for-2011.11/irc-change
>>
>> Thomas Petazzoni (1):
>> ? ? ?docs: change official IRC channel to #buildroot
>>
>> ?docs/docs.html | ? ?4 ++--
>> ?1 files changed, 2 insertions(+), 2 deletions(-)
>>
>> Thanks,
>> --
>> Thomas Petazzoni
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>

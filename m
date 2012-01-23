From: Will Newton <will.newton@gmail.com>
Date: Mon, 23 Jan 2012 13:50:14 +0000
Subject: [Buildroot] [PATCH 0/7] EFL packages for buildroot
In-Reply-To: <201201210251.26370.arnout@mind.be>
References: <CAFbHwiQEZ4T8xdPk9hx9MihC4LDMcvWTueuG1KfdxzQywG_B+Q@mail.gmail.com>
 <201201210251.26370.arnout@mind.be>
Message-ID: <CAFbHwiSf9R3ztZtQgRni1U3SfVthw=UU3W3PqevmeU8bL__BPw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 21, 2012 at 1:51 AM, Arnout Vandecappelle <arnout@mind.be> wrote:

Hi Arnout,

Many thanks for the review!

> On Wednesday 18 January 2012 12:15:14 Will Newton wrote:
>> These patches update the ones posted by Lionel Landwerlin a couple of years
>> ago, moving to released versions of the libraries and fixing up to reflect
>> changes in the buildroot infrastructure over the years.
> ?Shouldn't you add a SOB for Lionel, then? ?Or did he not add it in the original
> patches? ?In the latter case we have a copyright problem...

I have modified the patches quite a bit since this version of the
patch series so I do not know if adding Lionel's original SOB is the
right thing to do - I don't want to be putting his name to my bugs.
I'm happy to add it if people think it is the right thing to do
though?

>> Will Newton (7):
>> ? libeina: Add new package along with EFL infrastructure.
>> ? libeet: Add new package.
>> ? libevas: Add new package.
>> ? libecore: Add new package.
>> ? libembryo: Add new package.
>> ? libedje: Add new package.
>> ? expedite: Add new package.
>
> ?For the whole series:
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ?(I didn't reply to patches on which I had no comments.)

Thanks, I'll add those when I repost a v2 series that takes your
comments into account.

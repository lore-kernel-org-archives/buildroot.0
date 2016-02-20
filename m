From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 20 Feb 2016 12:07:54 +0100
Subject: [Buildroot] [PATCH v3] support/misc: Adding Vagrant file for
	provisioning
In-Reply-To: <20160220105636.GC3418@free.fr>
References: <1447887095-16773-1-git-send-email-angelo.compagnucci@gmail.com>
 <8737t8xx5a.fsf@dell.be.48ers.dk>
 <CA+TH9Vni80B2u4toCMZdBq0pj-YycNk9b1yTNULPMWMFapKfnw@mail.gmail.com>
 <20160220105636.GC3418@free.fr>
Message-ID: <CA+TH9VnQB_-2qKy2yRzOT6jCzz5hv4xiioW5r5g8F69G2sgrZg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN ,

2016-02-20 11:56 GMT+01:00 Yann E. MORIN <yann.morin.1998@free.fr>:
> Angelo, All,
>
> On 2016-02-05 09:05 +0100, Angelo Compagnucci spake thusly:
>> 2016-02-04 17:23 GMT+01:00 Peter Korsgaard <peter@korsgaard.com>:
>> > This no longer applies and as Yann mentioned it isn't really needed so
>> > I've dropped this hunk.
>>
>> I don't agree too much, giving hints to run buildroot on windows or
>> Mac Os X it's really important to grow our userbase and I think it
>> deserve it's own box on the download page!
>
> I think we should have just pointed to the Vagrant file, nothing more.
>
> Really, if someone knows what a Vagrant file is, they surely know how to
> use it, no? Or are you going to further expand that section with help on
> how to use Vagrant? And Puppet, Chef and the clique?

Obviously, I'm not in the position to steer the project in a way or
another, but IMHO giving a little bit of advice on how to run
Buildroot on others OSes could only benefit the project as a whole.

And please stop with that Puppet, Chef and other amenities, they are
not meant to rapidly build a virtual machine with some software inside
and nobody talked about them than you.

As I stated before, the goal here is to give the opportunity to the
people who cannot run Buildroot natively to use it anyway, in a simple
to run Vm.

Nothing more nothing less.

>
>> I'll submit a new patch soon.
>
> We should stop at some point, and really expect that the user knows at
> least some basic requirements. And I believe basic knowledge of Linux,
> the command line, and a little bit of gray matter are required.

Again, giving advice and being friendly on how a user wants to run
buildroot in his own machine could only benefit the project.

And little bit of modernity sometime it's not so bad!

> (and maybe I should stop ranting. ;-] )

Yes, I also think so :)

Sincerely, Angelo

>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo

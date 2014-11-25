From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Date: Tue, 25 Nov 2014 22:10:05 +0100
Subject: [Buildroot] [PATCH v4 0/9] autobuild-run improvements
In-Reply-To: <20141125214235.310f84c3@free-electrons.com>
References: <1415822317-22500-1-git-send-email-patrickdepinguin@gmail.com>
 <CAAXf6LUt25SUGQH9cGBcr8W9xypm1=rkQPKnmT2NL06u7j5RAw@mail.gmail.com>
 <20141125214235.310f84c3@free-electrons.com>
Message-ID: <CAAXf6LXbVGH3yZdp8UO-Yz3wwNfRiVRUWkx1ZyWDGPrortpwUw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 25, 2014 at 9:42 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue, 25 Nov 2014 21:36:47 +0100, Thomas De Schampheleire wrote:
>
>> > In case the final decision is not to introduce docopt, following improvements
>> > could be done to the current code:
>> >   - save the arguments from the command-line into a dictionary instead of plain
>> >     variables
>> >   - keep the added ini_config() method to also save the options in a dictionary,
>> >     and use the added merge() method to merge both arguments and config options
>> >     into one final configuration, without needing to handle it manually.
>>
>> Have you made a decision regarding the use of docopt in autobuild-run,
>> and these patches in general?
>
> No, not yet. It's still on my TODO-list though, but it will probably be
> done post-2014.11. Sorry for the long delay :/
>

No problem, I've been off of buildroot development the past month
anyway, should normally ramp up again now...

Best regards,
Thomas

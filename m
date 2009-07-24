From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 24 Jul 2009 10:43:06 +0200
Subject: [Buildroot] Write Access to buildroot?
In-Reply-To: <87skgmwm6h.fsf@macbook.be.48ers.dk>
References: <4A689265.6030308@atmel.com> <87skgmwm6h.fsf@macbook.be.48ers.dk>
Message-ID: <4A69741A.8010903@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard skrev:
>>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
>>>>>>             
>
>  Ulf> What happened to this?
>  Ulf> Can't even generate a branch right now...
>
> That's on purpose. See:
>
> http://lists.busybox.net/pipermail/buildroot/2009-March/026875.html
>
> and
>
> http://buildroot.net/git.html
>
>   
OK,
Have not been active for a while and have about 3000 unread emails.
Seems to me that there a multiple people with write access 
from the git commit mails, How come?

Personally, I think it would make sense to have
a development git with personal branches with write access.

This would complement any personal git's and would allow
easier testing with other people's patches.

The main tree, used for the release
could then pull changes from both the development tree
and the personal tree's.

Is there a list of maintainers?
The target/device/Atmel tree will need to be updated due to the SAM9G10/G45/M10/M11.
The target/linux tree is also in need of maintenance.


BR
Ulf Samuelsson

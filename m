From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 05 Apr 2010 23:49:06 +0300
Subject: [Buildroot] [git commit master] matchbox: convert to autotools,
 fix build with start-notification, libxft
In-Reply-To: <4BBA29A0.7000703@carallon.com>
References: <20100405092238.EDD8888D31@busybox.osuosl.org>
	<4BBA16A2.7050701@gmail.com> <4BBA29A0.7000703@carallon.com>
Message-ID: <4BBA4CC2.1040308@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/05/2010 09:19 PM, Will Wagner wrote:
> On 05/04/2010 17:58, Paulius Zaleckas wrote:
>> On 04/05/2010 11:47 AM, Will Wagner wrote:
>>>
>>> commit:
>>> http://git.buildroot.net/buildroot/commit/?id=f94830d0e5a409b2e2dc30a4e002c180fe09ec4e
>>>
>>> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>>>
>>> Signed-off-by: Will Wagner<will_wagner@carallon.com>
>>> Signed-off-by: Peter Korsgaard<jacmet@sunsite.dk>
>>
>> Previously matchbox-commons were installed, now there is even no way
>> to select
>> it, but .mk file is there :)
>> Don't know if it should be selectable or just added to root
>> matchbox.mk...
>>
> It gets built as a dependany of matchbox-wm. I did not make it an option
> as you would only want that without the window manager if you were
> trying to compile some custom app based on matchbox-common. Also it is
> exactly the same behaviour as the old matchbox makefile, the reason I
> spit it into seperate makefile was so it could be converted to autoools.
> If there is some issie with what is ther I am happy to fix it.

matchbox-wm has no dependency on matchbox-common.
I think you mixed it up with matchbox-lib...

> Will

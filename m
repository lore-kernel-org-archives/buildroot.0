From: Will Newton <will.newton@gmail.com>
Date: Thu, 15 Nov 2012 15:27:15 +0000
Subject: [Buildroot] [PATCH] binutils: add version 2.23.1
In-Reply-To: <50A5094F.8080001@zacarias.com.ar>
References: <1352988528-20158-1-git-send-email-gustavo@zacarias.com.ar>
 <87lie25299.fsf@dell.be.48ers.dk>
 <CAFbHwiRBmDSdfWL2pxFRrS-xkRoa0VB_FgrjFDk2oQG42pxeuA@mail.gmail.com>
 <50A5094F.8080001@zacarias.com.ar>
Message-ID: <CAFbHwiTmCbwarYSgnD7ZkRob7SOVK2T_4Obz6jCR5eJj75j=rA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 15, 2012 at 3:25 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> On 11/15/2012 12:17 PM, Will Newton wrote:
>
>> I believe that 2.23 was never officially packaged so it is probably
>> better to remove it.
>
> It's in official GNU mirrors, i'd say it has been.
> Doesn't mean we should keep it though.

From the 2.23.1 release announcement:

"Thanks to everyone who contributed to the release. The branch remains
open for bug fixes.

Note that because of packaging issues, binutils 2.23 was not released."

I'm not sure what the precise issues were but it seems safer to move to 2.23.1.

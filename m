From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 03 Aug 2019 09:12:35 +0200
Subject: [Buildroot] [PATCH 1/2] package/icu: Fix nios2 build
References: <20190803063135.24777-1-bernd.kuhls@t-online.de>
 <20190803084652.1a4a4acf@windsurf.home>
Message-ID: <3oof1gxvf.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Sat, 03 Aug 2019 08:46:52 +0200 schrieb Thomas Petazzoni:

> What is ICU-20751 ? It's not clear if the patch comes from upstream or
> not, since you are the author of patch.

ICU-20751 is the name of my bug report:
https://unicode-org.atlassian.net/browse/ICU-20751

The project mandats that patch subjects start with the name of the ticket:
http://site.icu-project.org/repository/gitdev
"Always prefix your commit statements with the Jira ticket number using 
this pattern (including the space after the number; note: no colon): 
ICU-23456 what I changed"

> Indeed, I see the nios2 and xtensa fixes are not the same, so I guess
> they have a different double conversion behavior, but how did you figure
> this out ?

Yes, the fix is the same, I split it into two pull requests, but they 
patch the same part of the long ifdef statement and the project allows: 
"You can have multiple pull requests per ticket."

> If it's an upstream fix, could you share a link to it ?

No, the patches are authored by me and sent upstream as pull requests.
Ah, and here is the point: I forgot to add the pull request URL to the 
patches, sorry, sent v2.

Regards, Bernd

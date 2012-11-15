From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 15 Nov 2012 12:30:37 -0300
Subject: [Buildroot] [PATCH] binutils: add version 2.23.1
In-Reply-To: <CAFbHwiTmCbwarYSgnD7ZkRob7SOVK2T_4Obz6jCR5eJj75j=rA@mail.gmail.com>
References: <1352988528-20158-1-git-send-email-gustavo@zacarias.com.ar>
 <87lie25299.fsf@dell.be.48ers.dk>
 <CAFbHwiRBmDSdfWL2pxFRrS-xkRoa0VB_FgrjFDk2oQG42pxeuA@mail.gmail.com>
 <50A5094F.8080001@zacarias.com.ar>
 <CAFbHwiTmCbwarYSgnD7ZkRob7SOVK2T_4Obz6jCR5eJj75j=rA@mail.gmail.com>
Message-ID: <50A50A9D.8060507@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/15/2012 12:27 PM, Will Newton wrote:

> From the 2.23.1 release announcement:
> 
> "Thanks to everyone who contributed to the release. The branch remains
> open for bug fixes.
> 
> Note that because of packaging issues, binutils 2.23 was not released."
> 
> I'm not sure what the precise issues were but it seems safer to move to 2.23.1.

From what i've read in the mailing list there were some tagging issues
and whatnot.
There was also the vanishing tarball issue, when i sent the initial 2.23
bump there was a tar.bz2 for 2.23 and then it was gone with only the
tar.gz remaining.
I'm not for or against the move, since it's not a default i see no big
issue removing it, but then we always gave some choice regarding
toolchain components.
Regards.

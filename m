From: Will Newton <will.newton@gmail.com>
Date: Thu, 17 Mar 2011 11:19:58 +0000
Subject: [Buildroot] can't load library 'libgomp.so.1'
In-Reply-To: <4D81EAE1.7090903@sensortherm.de>
References: <4D81EAE1.7090903@sensortherm.de>
Message-ID: <AANLkTim_zBJmFH3YM+RH8vt25gKcASCTgaJ_Y1LrN8T1@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 17, 2011 at 11:05 AM, Klaus Schwarzkopf
<schwarzkopf@sensortherm.de> wrote:
> Hi,
>
> if have installed imagemagick.
>
> On my target, i have this error:
>
> # convert --version
> convert: can't load library 'libgomp.so.1'

I submitted a patch for this some time ago:

https://bugs.uclibc.org/show_bug.cgi?id=2131

Not sure if it still applies to HEAD.

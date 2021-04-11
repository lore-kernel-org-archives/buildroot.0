From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Apr 2021 11:37:47 +0200
Subject: [Buildroot] [PATCH] package/i2c-tools: add upstream post-4.2
 i2ctransfer fix
In-Reply-To: <87pmz18jkd.fsf@tarshish> (Baruch Siach's message of "Sun, 11 Apr
 2021 08:41:06 +0300")
References: <20210410081252.17180-1-peter@korsgaard.com>
 <87pmz18jkd.fsf@tarshish>
Message-ID: <87czv140wk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Sat, Apr 10 2021, Peter Korsgaard wrote:

 >> i2c-tools 4.2 contained an invalid check, leading to verbose false-positive
 >> warning messages when the variable length ({r,w}?) option is used:
 >> 
 >> https://www.spinics.net/lists/linux-i2c/msg50032.html

 > Maybe also add a link to Jean's response:

 >   https://www.spinics.net/lists/linux-i2c/msg50253.html

Committed with the link added, thanks.

-- 
Bye, Peter Korsgaard

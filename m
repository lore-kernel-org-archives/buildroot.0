From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 07 Feb 2021 23:12:50 +0100
Subject: [Buildroot] [PATCH] configs/avenger96_defconfig: add support
 for Arrow Avenger96 board
In-Reply-To: <87blcvy715.fsf@tarshish> (Baruch Siach's message of "Sun, 07 Feb
 2021 22:09:10 +0200")
References: <20210207155534.7211-1-peter@korsgaard.com>
 <87h7mnyi4p.fsf@tarshish> <20210207165237.GP2384@scaer>
 <87eehryfr8.fsf@tarshish>
 <a86ec3d8-17d5-bd4d-d6e9-f0d29071eeb4@grinn-global.com>
 <87blcvy715.fsf@tarshish>
Message-ID: <871rdry1b1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Bartosz,
 > On Sun, Feb 07 2021, Bartosz Bilas wrote:
 >> On 2/7/21 6:00 PM, Baruch Siach wrote:
 >>> On Sun, Feb 07 2021, Yann E. MORIN wrote:
 >>>> On 2021-02-07 18:09 +0200, Baruch Siach spake thusly:
 >>>>> On Sun, Feb 07 2021, Peter Korsgaard wrote:
>>>>> +  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
 >>>>> Maybe warn that this overwrites data on the SD card.
 >>>> As far as I could see, we don't do that in any of the 72 readme.txt we
 >>>> already have...
 >>> $ git grep WARNING -- board/
 >>> ...
 >>> board/chromebook/elm/readme.txt:WARNING: make sure there is nothing important on that card,
 >>> board/chromebook/snow/readme.txt:WARNING: make sure there is nothing important on that card,
 >>> board/engicam/geam6ul/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
 >>> ...
 >>> 
 >> Is not that obvious that dd will overwrite the data? Imo it's superfluous
 >> information at all.

 > It might be obvious to you. Many newcomers don't know what dd is, or how
 > filesystem works. A warning can't hurt.

Indeed. I don't have a problem adding a oneliner warning. It doesn't
hurt, and it might indeed help stop someone from losing data.

-- 
Bye, Peter Korsgaard

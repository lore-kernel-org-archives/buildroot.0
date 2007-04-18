From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 18 Apr 2007 14:07:46 +0200
Subject: [Buildroot] RFC  Building Linux under Buildroot.
References: <1176885902.8660.5.camel@elrond.sweden.atmel.com>
	<20070418114046.GA10335@aon.at>
Message-ID: <01ba01c781b2$63d89a90$01c4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Bernhard Fischer" <rep.dot.nop@gmail.com>
To: "Ulf Samuelsson" <ulf@atmel.com>
Cc: <buildroot@uclibc.org>
Sent: Wednesday, April 18, 2007 1:40 PM
Subject: Re: [Buildroot] RFC Building Linux under Buildroot.


> On Wed, Apr 18, 2007 at 10:45:02AM +0200, Ulf Samuelsson wrote:
>>I enclose the Makefile.in and Config.in I use to Build Linux.
>>I have them in my targets/linux directory.
>>
>>Would like to have comments on that before I generate a real patch.
>>Think it makes for easier reading than the patch.
>>
>>Basically I would like to bbe able to select the most
>>common choices using checkboxes, but also allow full flexiubility
>>by providing a text version as well.
> 
> From a cursory look that seems fine.
> Does this handle multiple patch-files ?
>

Yes, but the patchfiles are in a linux  patch directory.



Best Regards
Ulf Samuelsson

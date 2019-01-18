From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Jan 2019 14:09:25 +0100
Subject: [Buildroot] [PATCH 2/3] board/lego/ev3: fix max U-Boot flash
 size
In-Reply-To: <20181227195305.5329-3-david@lechnology.com> (David Lechner's
 message of "Thu, 27 Dec 2018 13:53:04 -0600")
References: <20181227195305.5329-1-david@lechnology.com>
 <20181227195305.5329-3-david@lechnology.com>
Message-ID: <877ef25cze.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "David" == David Lechner <david@lechnology.com> writes:

 > The first stage bootloader on LEGO MINDSTORMS EV3 only loads the first
 > 256K of the flash memory (this is hard-coded in an EEPROM). So, the
 > second stage bootloader (U-Boot) cannot exceed this size.

 > Signed-off-by: David Lechner <david@lechnology.com>

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard

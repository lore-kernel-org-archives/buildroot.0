From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 07 Dec 2017 22:21:48 +0100
Subject: [Buildroot] [PATCH 1/1] board/orangepi: add support for
 orangepi-lite board
In-Reply-To: <20171207175926.8533-1-jan.kraval@gmail.com> (Jan Kraval's
 message of "Thu, 7 Dec 2017 18:59:26 +0100")
References: <20171207175926.8533-1-jan.kraval@gmail.com>
Message-ID: <87609i44k3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jan" == Jan Kraval <jan.kraval@gmail.com> writes:

 >     This board is quite similar to orangepi-one board. Instead of ethernet, it
 >     has RTL8189FTV SDIO WiFi chip.

Committed, thanks.

 >     Board support package includes the following components:
 >      - mainline u-boot 2017.09
 >      - mainline kernel 4.13.11

Any specific reason to not go for u-boot 2017.11 / kernel 4.14.4?

-- 
Bye, Peter Korsgaard

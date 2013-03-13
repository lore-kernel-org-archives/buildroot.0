From: Przemyslaw Wrzos <przemyslaw.wrzos@calyptech.com>
Date: Wed, 13 Mar 2013 12:36:22 +1100
Subject: [Buildroot] [PATCH 1/1] python: fix to ensure libpython
	isstripped
Message-ID: <EE5E77B503DE9A478B63A89AAD2585EDB66A5F@vpane.excalyptech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 26 Feb 2013 at 18:21:15, Przemyslaw Wrzos wrote:

> Hi All,
> 
>> Subject: [PATCH 1/1] python: fix to ensure libpython is stripped
>> 
>> The python and python3 builds mark libpython as read-only which
>> prevents it from being stripped out correctly for the target.
> 
> Is there any updates regarding this patch?

Ping.

Cheers,
Przemyslaw Wrzos

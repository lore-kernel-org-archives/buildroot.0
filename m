From: Andreas Naumann <dev@andin.de>
Date: Fri, 27 Jan 2017 15:20:31 +0100
Subject: [Buildroot] [PATCH v5 08/10] python-pyqt5: Depend directly on
 Qt5 rather than its toolchain requirements
In-Reply-To: <20170127212120.04eaddfe@free-electrons.com>
References: <1485439461-4797-1-git-send-email-anaumann@ultratronik.de>
 <1485439461-4797-9-git-send-email-anaumann@ultratronik.de>
 <20170127212120.04eaddfe@free-electrons.com>
Message-ID: <9311d4db-5c83-2dfe-48d7-9cd9ded1af28@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am 27.01.2017 um 09:21 schrieb Thomas Petazzoni:
> Hello,
>
> On Thu, 26 Jan 2017 15:04:19 +0100, Andreas Naumann wrote:
>> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
>> ---
>>  package/python-pyqt5/Config.in | 13 +++----------
>>  1 file changed, 3 insertions(+), 10 deletions(-)
>
> What was the motivation for this change? The commit log is empty :-/
>
> Note that I don't disagree with the change, but a little bit more
> details about the rationale would be good.

That would be your comment in v3 of this set:

"When you want python-qt5 it's really obvious that you need
Qt5, so for the user it's logical to enable Qt5 and then Python-Qt5."

Unfortunately, I wont have time to rework this and your other two 
comments in the next 10 days. If you need to apply the set earlier than 
that, feel free to just change as needed.


Thanks!
Andreas

>
> Thomas
>

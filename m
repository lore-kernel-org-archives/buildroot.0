From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Thu, 2 Feb 2017 09:57:57 +0100
Subject: [Buildroot] [PATCH v6 8/9] python-pyqt5: Depend directly on Qt5
 rather than its toolchain requirements
In-Reply-To: <20170201222915.58e4f805@free-electrons.com>
References: <1485849551-20469-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <1485849551-20469-9-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <20170201222915.58e4f805@free-electrons.com>
Message-ID: <38d15b3f-1032-4cda-b73e-9489c8a11806@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/01/2017 10:29 PM, Thomas Petazzoni wrote:

> Hello,
>
> On Tue, 31 Jan 2017 08:59:10 +0100, Zoltan Gyarmati wrote:
>> From: Naumann Andreas <ANaumann@ultratronik.de>
>>
>>  When pyqt5 is used it's obvious that qt5 needs to be selected and configured
>> by the user, hence we enforce it by making pyqt5 depending on qt5, rather than
>> selecting it and depending only on the qt5 requirements.
>>
>> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
>> Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
> The previous version of this patch series from Andreas was doing this
> change for both python-pyqt and python-pyqt5. But in your new version,
> you have removed Andreas patch making the change to python-pyqt, and
> only kept the python-pyqt5 change. Why? Due to this, the handling of
> python-pyqt would no longer be consistent with the one of python-pyqt5.

Ah, i was focusing on the qt5 related things, but you are right, it
should be consistent, i'll add it back, thanks for noting this. Did you
find any other flaw in the series?
>
> Thanks,
>
> Thomas
Thanks,

Zoltan Gyarmati
https://zgyarmati.de


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170202/84cc8b61/attachment.asc>

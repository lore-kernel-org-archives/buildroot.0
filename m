From: Julian Scheel <julian@jusst.de>
Date: Fri, 22 Apr 2016 09:29:32 +0200
Subject: [Buildroot] [PATCHv2 1/4] Add package cryptopp
In-Reply-To: <20160421224000.031987c9@free-electrons.com>
References: <1458227038-16383-1-git-send-email-julian@jusst.de>
 <1458227038-16383-2-git-send-email-julian@jusst.de>
 <20160421224000.031987c9@free-electrons.com>
Message-ID: <5719D2DC.9020702@jusst.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 21.04.2016 22:40, Thomas Petazzoni wrote:
> On Thu, 17 Mar 2016 16:03:55 +0100, Julian Scheel wrote:
>> Signed-off-by: Julian Scheel <julian@jusst.de>
>> ---
>>   package/cryptopp/cryptopp.hash |  2 ++
>>   package/cryptopp/cryptopp.mk   | 33 +++++++++++++++++++++++++++++++++
>>   2 files changed, 35 insertions(+)
>>   create mode 100644 package/cryptopp/cryptopp.hash
>>   create mode 100644 package/cryptopp/cryptopp.mk
>
> This package causes some build failures:
>
>    http://autobuild.buildroot.org/?reason=host-cryptopp-5.6.3
>
> Could you have a look at them?

Should be fixed by:
[PATCH] package/cryptopp: Backport gcc compatibility patch

-Julian

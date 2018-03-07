From: =?UTF-8?Q?Bartosz_Bi=c5=82as?= <b.bilas@grinn-global.com>
Date: Wed, 7 Mar 2018 15:08:37 +0100
Subject: [Buildroot] [PATCH] package/qt5/qt5scxml: install missing QML
 module
In-Reply-To: <20180302222423.678df640@windsurf.home>
References: <20180301074610.18946-1-b.bilas@grinn-global.com>
 <20180301115003.6cc39376@gmx.net> <20180302222423.678df640@windsurf.home>
Message-ID: <4b6adeb3-74c6-4192-480b-6772a0cf7051@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
In my opinion no, according to the other packages they also have 
dependence on qt quick
and if it is not selected then they do not install files related to QML.

Best regards,
Bartosz Bi?as


On 02.03.2018 22:24, Thomas Petazzoni wrote:
> Hello,
>
> On Thu, 1 Mar 2018 11:50:03 +0100, Peter Seiderer wrote:
>
>> The dependency on BR2_PACKAGE_QT5DECLARATIVE_QUICK is not needed, the QtScxml
>> module is build/installed even without enabled BR2_PACKAGE_QT5DECLARATIVE_QUICK...
> But does it make sense to install QML files if the Qt that has been
> built has no way to use them ? Or am I missing something about what
> BR2_PACKAGE_QT5DECLARATIVE_QUICK is ?
>
> Best regards,
>
> Thomas

-- 
Bartosz Bi?as
	Grinn sp. z o.o. <http://grinn-global.com>
Junior Software Developer

	
LinkedIn <https://www.linkedin.com/company/grinn> 	Twitter 
<https://twitter.com/GrinnInt> 	YouTube 
<https://www.youtube.com/channel/UCiiEEK1yzyeMSeku06RFXPQ>

GRINN sp. z o.o
Wagonowa 2
53-609 Wroc?aw 	tel. +48 71 716 40 99
fax +48 71 716 41 53
www.grinn-global.com <http://grinn-global.com/> 	KRS: 0000230049
NIP: 8992730302
REGON: 020047322 	S?d Rejonowy we Wroc?awiu
VI Wydzia? Gospodarczy
Kapita? zak?adowy: 125.000,00 z?


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180307/a43b828d/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: Grinn.png
Type: image/png
Size: 5695 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180307/a43b828d/attachment.png>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: LinkedIn.png
Type: image/png
Size: 521 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180307/a43b828d/attachment-0001.png>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: Twitter.png
Type: image/png
Size: 338 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180307/a43b828d/attachment-0002.png>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: YouTube.png
Type: image/png
Size: 593 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180307/a43b828d/attachment-0003.png>

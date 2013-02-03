From: hayate <hayatelee@gmail.com>
Date: Sun, 3 Feb 2013 23:13:18 +0800
Subject: [Buildroot] Errors about BX when building toolchain under latest
	buildroot
Message-ID: <CAJXWAww+geVHWFvn4dy+HaFs0P8vNtHX11xCVUo5tCvAvEx1Pw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Latest buildroot buildroot-2012.11.1
choose: arm-LittleEndian, generic arm, OABI, gcc 4.6.3, uClibc-0.9.33.1

Others are unchanged

Then encounter errors saying that BX is not available on the target
processor

However changing to uClibc from 0.9.33 to 0.9.31 makes building successful.

Is this a bug? Should that USE_BX or 0.9.33 be disabled when selecting
generic arm?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130203/4f3806fe/attachment.html>

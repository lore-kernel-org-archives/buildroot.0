From: Siddharth Menon <siddharth.menon@motional.com>
Date: Wed, 26 May 2021 16:06:41 -0400
Subject: [Buildroot] http://sources.buildroot.net outage
In-Reply-To: <mailman.18583.1622059078.203266.buildroot@busybox.net>
References: <mailman.18583.1622059078.203266.buildroot@busybox.net>
Message-ID: <CACFsnY0pcjds_Z8+jEV1pmE_60xA1wFmJ+yq17oQ1Ymb1mzGWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Some of our CI jobs are failing because it looks like
http://sources.buildroot.net
<https://urldefense.com/v3/__http://sources.buildroot.net__;!!OUh6yQBS5Rss!s2U8npqgKhNTD6J6DwpxoUix6K0uHbN3P5QfE7RAvseO8G_3gFCzmKfmSaTRYCKPpcpbPA$>
is experiencing an outage:
[image: image.png]
I couldn't find any outage reports. Is this something that can be resolved
soon?

There seem to be other links broken in my image which is why the build is
using the backup URL:
[image: image.png]

Sincerely,

- Sid Menon

-- 
This email contains information belonging to Motional AD LLC or its 
affiliates and may contain confidential, proprietary, copyrighted and/or 
privileged information. Any unauthorized review, use, reliance, disclosure, 
distribution or copying is prohibited. If you are not the intended 
recipient, immediately destroy all copies of the original email and any 
attachments and contact the sender by reply email.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210526/1bb7ec95/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: image.png
Type: image/png
Size: 140564 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210526/1bb7ec95/attachment-0002.png>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: image.png
Type: image/png
Size: 77857 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210526/1bb7ec95/attachment-0003.png>

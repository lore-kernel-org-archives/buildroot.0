From: MAVINDI Dimitri <dimitri.mavindi@thalesgroup.com>
Date: Tue, 5 Sep 2017 16:28:55 +0200
Subject: [Buildroot] Buildroot : RTAI Real-time patch issue
Message-ID: <B0E42342CF573846B53369E0E3AD66A8E7C04571F0@THSONEA01CMS12P.one.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

By way of introduction, this is my working configuration :
Buildroot version : 2016.02
Linux Kernel Version : 3.16.0
RTAI package version : 4.1 (by default, the version 4.0.1 is provided by Buildroot. Nevertheless, the version version 4.1 of RTAI contains the file base/arch/x86/patches/hal-linux-3.16-x86-3.patch).

So, in make menuconfig, I have selected the rtai module in Kernel > Linux Kernel Extensions > [*] RTAI Real-time patch.
Then I run make and met the following issue :
Configure : error: HAL patch not applied/enabled in $(MyBuildrootWorkspace)/output/build/linux-3.16
Does anyone have ever met this issue? How can it be solved?

Best Regards,

Dimitri MAVINDI
Apprentice Software Engineer

Thales Communications & Security

www.thalesgroup.com<http://www.thalesgroup.com/>


[cid:image001.png at 01D3264E.8F7E25B0]


  [cid:image002.png at 01D3264E.8F7E25B0] <http://www.linkedin.com/company/thales>

  [cid:image003.png at 01D3264E.8F7E25B0] <https://twitter.com/thalesjobs>

  [cid:image004.png at 01D3264E.8F7E25B0] <https://www.facebook.com/thalesfrance>

  [cid:image005.png at 01D3264E.8F7E25B0] <https://www.youtube.com/user/thethalesgroup>

  [cid:image006.png at 01D3264E.8F7E25B0] <https://pinterest.com/thalesgroup/>

  [cid:image007.png at 01D3264E.8F7E25B0] <https://plus.google.com/+thales>




-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170905/5820b4fd/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: image001.png
Type: image/png
Size: 42416 bytes
Desc: image001.png
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170905/5820b4fd/attachment.png>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: image002.png
Type: image/png
Size: 1621 bytes
Desc: image002.png
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170905/5820b4fd/attachment-0001.png>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: image003.png
Type: image/png
Size: 1621 bytes
Desc: image003.png
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170905/5820b4fd/attachment-0002.png>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: image004.png
Type: image/png
Size: 1488 bytes
Desc: image004.png
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170905/5820b4fd/attachment-0003.png>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: image005.png
Type: image/png
Size: 1490 bytes
Desc: image005.png
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170905/5820b4fd/attachment-0004.png>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: image006.png
Type: image/png
Size: 1709 bytes
Desc: image006.png
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170905/5820b4fd/attachment-0005.png>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: image007.png
Type: image/png
Size: 1802 bytes
Desc: image007.png
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170905/5820b4fd/attachment-0006.png>

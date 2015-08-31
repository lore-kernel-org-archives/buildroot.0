From: Lee, Tommy <Tommy_Lee@alliedtelesis.com>
Date: Mon, 31 Aug 2015 13:58:04 -0700
Subject: [Buildroot] First rootfile system build using buildroot
In-Reply-To: <CAKpDV8tYxteVo=nKwMih_Ub-dxCQM=xh2G-AC3riPevrMySrNw@mail.gmail.com>
References: <CAKpDV8uVJjtssJDEx4knqtATvjXzy+kdKtwBoWWLcv-9v4cikg@mail.gmail.com>
 <CAKpDV8uLvtaLFK=Oxd5vw-zpkzB9C+m0_hhmx-9meZSRViW12g@mail.gmail.com>
 <944894A3EB1D044A9003B2F944389BB20474C344F7@svr-wa-exch1.atg.lc>
 <CAKpDV8tYxteVo=nKwMih_Ub-dxCQM=xh2G-AC3riPevrMySrNw@mail.gmail.com>
Message-ID: <944894A3EB1D044A9003B2F944389BB20474C3452F@svr-wa-exch1.atg.lc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Katoch,

Using the internal toolchain saves your time and effort on the external toolchain installation. This is one of the Buildroot benefits.

Building the rootfilesystem into zImage resolves the rootfilesystem loading/linking issue clearly. I do not see any reason to build and load the rootfilesystem independently.

Tommy

________________________________
This e-mail message is for the sole use of the intended recipient(s) and may contain confidential and privileged information. Any unauthorized review, use, disclosure or distribution is prohibited. If you are not the intended recipient, please contact the sender by reply e-mail and destroy all copies of the original message. If you are the intended recipient, please be advised that the content of this message is subject to access, review and disclosure by the sender's e-mail System Administrator.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150831/fc42e45e/attachment.html>

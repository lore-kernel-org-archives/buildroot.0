From: =?utf-8?Q?Micha=C5=82_Kalbarczyk?= <michal@gamecodehq.com>
Date: Tue, 10 Apr 2018 16:31:05 +0200
Subject: [Buildroot] Direct rendering with XORG and AMDGPU
Message-ID: <162E260C-3293-4AEE-9519-0D0E030168C6@gamecodehq.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I?m trying to build a firmware that support xorg and amdgpu with hardware acceleration. The build is made within nerves. I can?t get software rendering work.

Figured out that xorg driver reports empty list of supported cards.

If you want to look at configs please check GitHub repo: https://github.com/fazibear/nerves_system_xorg_x86_64 <https://github.com/fazibear/nerves_system_xorg_x86_64>

There is some dependencies that I missing?

Thanks for your help.
Micha?.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180410/6d790f5f/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: Message signed with OpenPGP
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180410/6d790f5f/attachment.asc>

From: Choi, David <David.Choi@Micrel.Com>
Date: Wed, 25 Aug 2010 14:41:40 -0700
Subject: [Buildroot] uImage build error
Message-ID: <C43529A246480145B0A6D0234BDB0F0D481DAC@MELANITE.micrel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

 

I am new to buildroot. The version that I use is v2010.05(stable
version)

 

As you see the attached, I almost the default value except mips(little
endian mode).

My Linux version is 2.6.33.5(default version) and configuration is
tb0229_defconfig.

 

Whenever I have tried to build uImage, I have gotten an error message
saying "make[1]: *** No rule to make target `uImage`. Stop.

(Even though I have tried with v2010.08(rc1), I had the same error
message)

 

 

Any comment will be highly appreciated.

 

 

Regards,

David J. Choi

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100825/f82b877f/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: linux-2.6.33.5.config
Type: application/octet-stream
Size: 27679 bytes
Desc: linux-2.6.33.5.config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100825/f82b877f/attachment-0002.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot2010-05.config
Type: application/octet-stream
Size: 17543 bytes
Desc: buildroot2010-05.config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100825/f82b877f/attachment-0003.obj>

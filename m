From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Sat, 18 Oct 2008 21:56:39 +0200
Subject: [Buildroot] ext2+isofs initrd too big
In-Reply-To: <e4c675870810181157u69e5e3d4j3ed89b53a414c6f3@mail.gmail.com>
References: <e4c675870810181157u69e5e3d4j3ed89b53a414c6f3@mail.gmail.com>
Message-ID: <e4c675870810181256j11da9c1eha5035bedc7a088a4@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2008/10/18 Roberto A. Foglietta <roberto.foglietta@gmail.com>:
> Hi,
>
>  using buildroot I have compiled a system which is big enough to not
> fit in the initrd image (default size is 4Mb but could be enlarged by
> kernel .config). Attached patch prepare a initrd of 16Mb and I can
> enlarge it more in order to put all my system inside. However this is
> not the best solution because has no future itself, initrd image could
> not enlarged forever.

 _Attached patch_ forgot, until now

 Ciao,
-- 
/roberto
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot-svn_r23678.diff
Url: http://busybox.net/lists/buildroot/attachments/20081018/580dc8e0/attachment-0001.txt 

From: yilu at bupt.edu.cn <yilu@bupt.edu.cn>
Date: Tue, 1 Dec 2020 21:08:23 +0800
Subject: [Buildroot] Is it possible to build rpm with buildroot?
References: <202012012017451423165@bupt.edu.cn>, 
	<87zh2xog49.fsf@tarshish>
Message-ID: <202012012108224311878@bupt.edu.cn>+D094D2A10DF8052A
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you, Baruch

I got it. Is it possible for me to add something new to buildroot source codes to generate binary packages? I am sorry that I am not familiar with buildroot and I am trying to test the feasibility to build rpm for my OS with the help of buildroot.



Beenle Yi
yilu at bupt.edu.cn
 
From: Baruch Siach
Date: 2020-12-01 20:39
To: yilu at bupt.edu.cn
CC: buildroot
Subject: Re: [Buildroot] Is it possible to build rpm with buildroot?
Hi Beenle Yi,
 
On Tue, Dec 01 2020, yilu at bupt.edu.cn wrote:
> I am trying to build rpm for a Linux-like operating system, but
> instead of rootfs, I want to build rpm. Is it possible to build rpm
> with buildroot? If it is, could you give me some advice?
 
Short answer: Buildroot does not support generation of binary packages.
 
For some more details, see the manual FAQ:
 
  https://buildroot.org/downloads/manual/manual.html#faq-no-binary-packages
 
baruch
 
-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201201/7d1db310/attachment.html>

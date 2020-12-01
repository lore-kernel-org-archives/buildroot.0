From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 01 Dec 2020 14:39:02 +0200
Subject: [Buildroot] Is it possible to build rpm with buildroot?
In-Reply-To: <202012012017451423165@bupt.edu.cn>
References: <202012012017451423165@bupt.edu.cn>
Message-ID: <87zh2xog49.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

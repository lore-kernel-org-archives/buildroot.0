From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 12 Apr 2016 20:56:31 -0300
Subject: [Buildroot] [PATCH 2/4] board/minnowboard: Rework to generate
 SD card image
In-Reply-To: <570D83AF.5030108@mind.be>
References: <1460438965-28065-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460438965-28065-3-git-send-email-ezequiel@vanguardiasur.com.ar>
 <570D83AF.5030108@mind.be>
Message-ID: <CAAEAJfAN9tZDQxuAEWmjc8ANha0=QV_3aRm=a_4uBHdVJCYF=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12 April 2016 at 20:24, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 04/12/16 07:29, Ezequiel Garcia wrote:
>>
>> Let's rework the board and config files to use genimage
>> to generate the SD card image directly.
>>
>> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>
>
>  Instead of this patch, wouldn't it be nicer to unify the minnowboard and
> minnowboard-max directories? Or at least, make the genimage.cfg,
> post-image.sh and readme.txt a symlink to the -max equivalent (grub.cfg and
> linux.config are different).
>

Yeah, that's a good idea. I'll see what I can do.
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar

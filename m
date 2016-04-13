From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Wed, 13 Apr 2016 19:02:09 -0300
Subject: [Buildroot] [PATCH 04/15] board/wandboard: Leverage the new
	genimage infra
In-Reply-To: <20160413222542.64ef3827@free-electrons.com>
References: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460577820-32164-5-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20160413222542.64ef3827@free-electrons.com>
Message-ID: <CAAEAJfCQgAwVRC9Q34eVXGEQQ41Lsyi4hdKH=u=9jZhqzmPQhQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13 April 2016 at 17:25, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Wed, 13 Apr 2016 17:03:29 -0300, Ezequiel Garcia wrote:
>
>> -BR2_ROOTFS_POST_IMAGE_SCRIPT="board/wandboard/post-image.sh"
>> +BR2_ROOTFS_POST_IMAGE_SCRIPT=
>
> Not good :)
>

Ouch, bad commit fixup.
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar

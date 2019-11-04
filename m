From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Mon, 4 Nov 2019 18:07:11 +0100
Subject: [Buildroot] [PATCH 2/2] board/stm32mp157c-dk2: remove
 unnecessary workaround
In-Reply-To: <87o8xsg58l.fsf@dell.be.48ers.dk>
References: <20191103115017.788940-1-b.bilas@grinn-global.com>
 <20191103115017.788940-2-b.bilas@grinn-global.com>
 <87o8xsg58l.fsf@dell.be.48ers.dk>
Message-ID: <acd3af3f-a83f-ffd7-3e9a-540542b58445@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On 03.11.2019 19:54, Peter Korsgaard wrote:
>>>>>> "Bartosz" == Bartosz Bilas <b.bilas@grinn-global.com> writes:
>   > Since we know the proper solution, remove that faulty patch.
>
> Ehh, can you be a bit more specific? Do you mean that the change of
> ext4fs parameters fix the issue that this is trying to work around?

I'm sorry for that - it was so obvious for me during patches generation. 
Yes, I do - disabling new features that are enabled by default in new 
mkfs version fix the issue with mounting rootfs partition.

Best
Bartek

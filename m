From: Carlo Caione <carlo.caione@gmail.com>
Date: Sun, 3 Mar 2013 21:53:16 +0100
Subject: [Buildroot] [PATCH] u-boot: u-boot SPL is usually under ./spl/
In-Reply-To: <20130303205242.423ad324@skate>
References: <1362329351-7738-1-git-send-email-carlo.caione@gmail.com>
 <20130303192824.2a2faf5d@skate>
 <CAOQ7t2ZJsu5u706BHJsuX6vOPgB5_oUJfF05EZYESpCjunvb=Q@mail.gmail.com>
 <20130303205242.423ad324@skate>
Message-ID: <CAOQ7t2bGKQ7y_9ap1AMxi9On8Z_CqUTJDwDPcG3XEM+9KMzrQw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 3, 2013 at 8:52 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Carlo Caione,
>
> On Sun, 3 Mar 2013 19:55:48 +0100, Carlo Caione wrote:
>
>> > In the case of OMAP, the SPL gets generated in the main source
>> > directory. For which configuration do you see that it is installed only
>> > in the spl/ sub-directory?
>>
>> I'm trying to use buildroot to create an image for a cubieboard
>> (http://cubieboard.org/).
>> In this case I have to use u-boot-sunxi and SPL gets generated only in spl/
>
> Right, I tested this, and it gets installed in spl/.
>
> What about setting BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.bin" ?

Well, honestly I don't like it (not really clean) but I'll go for it
if there is no other way :)
(BTW, IIRC MLO in OMAP is just spl/u-boot-spl.bin with an additional header)

Regards,

--
Carlo Caione

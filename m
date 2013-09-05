From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 5 Sep 2013 10:06:56 +0200
Subject: [Buildroot] [PATCH] trivial: remove odd references to
	'buildroot2'
In-Reply-To: <20130905093405.206e144a@skate>
References: <ed18f0f200351fcbb737.1378365135@argentina>
 <20130905093405.206e144a@skate>
Message-ID: <CAAXf6LWmPRwXz0LRgo2VcR8w0xbVF+Hzp-jTy_g2k4BJ_RkYEQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 5, 2013 at 9:34 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Thu, 05 Sep 2013 09:12:15 +0200, Thomas De Schampheleire wrote:
>> In the past there may have been a very good reason to refer to 'buildroot2', but
>> these days it's just odd.
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> Definitely-acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>

Thanks!

> Next step is obviously to rename all config options from BR2_ to BR_ :-)
>

Funny that you bring this up, I hadn't even made the connection!
So, does kconfig have any limit on the number of items allowed in the
legacy menu? :-D

Best regards,
Thomas

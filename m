From: Jose Luis Zabalza <jlz.3008@gmail.com>
Date: Sun, 16 Sep 2018 07:28:06 +0200
Subject: [Buildroot] custom kernel
In-Reply-To: <CABWt4etsA7gXpoSz33UaDeZyCU+r5qD3Z3UgBUs1-VUdkS3aTg@mail.gmail.com>
References: <CAKZffXHDkoZJ+LN75Cp3WZfuE3rdhH2SJTzA__7YC6YGY=M7MA@mail.gmail.com>
 <87efdw4otc.fsf@tkos.co.il>
 <CAKZffXFaJKWdaWXw6Ff7-Ptq+QrE0NDnOJOefBG2u-ZBjwiYEw@mail.gmail.com>
 <CABWt4etsA7gXpoSz33UaDeZyCU+r5qD3Z3UgBUs1-VUdkS3aTg@mail.gmail.com>
Message-ID: <CAKZffXH=92==xfb7B4daaO1D1AR-u1r-FcGT8ChCcstiaxHzgQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El vie., 14 sept. 2018 a las 23:53, Robert Smigielski
(<ptdropper@gmail.com>) escribi?:
>
> Hi Jose I'm using an older buildroot version as well and have similar problems. The solution I came up with is that I created my own repository on the public GitHub website. I upload the kernel sources and the tarball to my personal GitHub. I configure buildroot so it knows where to pull the kernel sources. Then at that point it looks like any other kernel coming from a website so I can apply local patches.
>

This is a good idea, but not for me. I would like to not depend of
Internet connection. Now I have all source packages pre-downloaded,
so, I don't need Internet to build the image.

Thanks.



-- 
Linux Counter 172551
https://linuxcounter.net/cert/172551.png

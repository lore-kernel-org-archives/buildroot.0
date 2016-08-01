From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 1 Aug 2016 06:22:38 +0300
Subject: [Buildroot] "no hash found" error for host-gcc-initial-4.9.3
 package verification
In-Reply-To: <CAJe0E3e22wsz_+x9ztXOS7aZaMPuP4L0PXRoavpwCRJy9VJCww@mail.gmail.com>
References: <CAJe0E3e22wsz_+x9ztXOS7aZaMPuP4L0PXRoavpwCRJy9VJCww@mail.gmail.com>
Message-ID: <20160801032238.GM3620@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guillaume

On Sun, Jul 31, 2016 at 04:39:40PM -0600, Guillaume William Bres wrote:
> I want one of my coworkers to build a custom linux image using some default
> buildroot stuff. The system builds fine on my machine but it fails on his:
> 
> 
>    - Buildroot downloads host-gcc-initial-4.9.3,
>    - tries a file verification with either md5sum or sha-sum: error: "ho
>    hash found"
>    - Buildroot downloads host-gcc initial-4.9.3 from a mirror
>    - same problem.
> 
> 
> Where does this problem come from? His machine does have md5sum and all
> sha-x-sum tools installed, I was able to build the system on mine in the
> meantime without any problems.
> 
> File verifications should give an error message but not actually cause the
> build to stop right?

Which version of Buildroot do you use?

Please post your .config file, and the last few lines of the build log.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

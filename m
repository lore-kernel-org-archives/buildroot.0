From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 14 Jun 2016 13:34:00 +0300
Subject: [Buildroot] Clean and rebuild rootfs.ext2 and rootfs.tar
In-Reply-To: <CALtfCQYcXvZLsVhNAzZ_wdR=R9-rw72cw7BvNvDM2nSEwAcM1A@mail.gmail.com>
References: <CALtfCQYcXvZLsVhNAzZ_wdR=R9-rw72cw7BvNvDM2nSEwAcM1A@mail.gmail.com>
Message-ID: <20160614103400.GH2749@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Oscar,

On Tue, Jun 14, 2016 at 11:32:32AM +0200, Oscar Gomez Fuente wrote:
> Is there any way to clean the files: rootfs.ext2 and rootfs.tar and rebuild
> them again? I only want to guarantee that my rootfs.ext2 and rootfs.tar are
> updated. Up to know I was using: make clean && make, but I spend a lot of
> time.

Just deleting these files and running 'make' should do the trick.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

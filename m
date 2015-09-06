From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 6 Sep 2015 12:10:33 +0300
Subject: [Buildroot] Buildroot kconfig option
In-Reply-To: <CAKpDV8vL7GHk3cQ5Jk5o4G654KfQpQAfopsrA0Fotvu+vsaKMw@mail.gmail.com>
References: <CAKpDV8vL7GHk3cQ5Jk5o4G654KfQpQAfopsrA0Fotvu+vsaKMw@mail.gmail.com>
Message-ID: <20150906091033.GC2213@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Katoch,

On Sun, Sep 06, 2015 at 02:33:15PM +0530, Dinesh Guleria wrote:
> I am downloading kernel directly using buildroot. Then select "
> Using an in-tree defconfig file" then
> type the name of the defconfig.
> 
> Here i am using a already existing defconfig file in kernel source tree.
> 
> Now it could be the case existing configuration in Linux kernel source may
> not be as per my requirement.
> 
> My question is, can i perform kconfig operation on the kernel source
> downloaded by buildroot , so that i can tune kernel as per my requirement ?
> 
> Buildroot manual says :--
> "use make linux-menuconfig to open the Linux configuration editor"
> http://buildroot.uclibc.org/downloads/manual/manual.html#configure
> 
> Or i download kernel source separately & configure it separately & tell
> buildroot to use it ?
> 
> How you use to deal with this situation related to kernel kconfig ?

Please see "Linux kernel" in chapter 7 of the manual: 
http://nightly.buildroot.org/manual.html#_configuration_of_other_components.

For information on storing your modified kernel configuration see section 9.4: 
http://nightly.buildroot.org/manual.html#customize-store-package-config.

Hope this helps,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

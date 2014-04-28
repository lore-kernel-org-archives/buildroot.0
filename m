From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 28 Apr 2014 16:49:52 +0300
Subject: [Buildroot] Grub or Network driver Compilation error !
In-Reply-To: <37401db706d9ddea13b5101ae56a1983@paravisioner.com>
References: <37401db706d9ddea13b5101ae56a1983@paravisioner.com>
Message-ID: <20140428134952.GJ4531@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Parsa Panahi,

On Mon, Apr 28, 2014 at 06:01:05PM +0430, Parsa Panahi wrote:
> My buildroot make process stuck in the grub configuration and I don't
> know what exactly it is suffering from ?! I think it's something related
> to realtek 8139 network driver but I don't know what caused the error
> here .... 
> 
> Can anyone help me what to do ? I've attached my config file too. 
> 
> parsa at parsa-pc:~/Software/buildroot/buildroot-2014.02$ SUDO MAKE 

I'm not sure it has anything to do with your problem, but you should never run 
Buildroot 'make' as root.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 4 Feb 2016 07:21:32 +0200
Subject: [Buildroot] Why is libbsd limited to ARM, x86 and x86_64?
In-Reply-To: <56B2948E.2090805@mind.be>
References: <1326783145.511396.1454427009117.JavaMail.zimbra@datacom.ind.br>
 <56B11B08.2070306@mind.be>
 <1351688359.878304.1454513991848.JavaMail.zimbra@datacom.ind.br>
 <1734711132.950514.1454525438621.JavaMail.zimbra@datacom.ind.br>
 <56B2948E.2090805@mind.be>
Message-ID: <20160204052132.GK3529@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Carlos, Arnout,

On Thu, Feb 04, 2016 at 01:00:14AM +0100, Arnout Vandecappelle wrote:
> On 03-02-16 19:50, Carlos Santos wrote:
> > 2. I'm absolutely ignorant about nios2. What defconfig should I use to 
> > build for it? 
> 
>  Hm, looks like we don't have a nios2 defconfig... But you can do a very quick
> build-test by setting arch to nios2 and selecting the Sourcery toolchain.

You can also use the config at 
http://autobuild.buildroot.net/toolchains/configs/br-nios2-glibc.config.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

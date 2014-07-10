From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 10 Jul 2014 17:24:52 +0300
Subject: [Buildroot] ping not working in a glibc based buildroot
In-Reply-To: <53BE9FA5.9070002@scalemp.com>
References: <53BD576F.1060008@scalemp.com> <53BE83E8.2010906@scalemp.com>
 <20140710142322.188e88ed@free-electrons.com>
 <53BE887E.7070606@scalemp.com>
 <20140710145619.5925fa1b@free-electrons.com>
 <53BE8EF2.9000306@scalemp.com>
 <20140710153435.6b2ab536@free-electrons.com>
 <53BE97D3.5090009@scalemp.com>
 <20140710160659.18c3af57@free-electrons.com>
 <53BE9FA5.9070002@scalemp.com>
Message-ID: <20140710142452.GV3003@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eial,

On Thu, Jul 10, 2014 at 05:13:57PM +0300, Eial Czerwacki wrote:
> I've added libnss_dns-2.18.so to the img and libresolv.so and it seems
> to be working.
> the files are missing because I work in a kinda limited size.

You may consider using uClibc or musl if your storage capacity is that tight.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

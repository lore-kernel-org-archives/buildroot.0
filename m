From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 23 Nov 2015 12:51:10 +0200
Subject: [Buildroot] Which package contains modprobe in buildroot
In-Reply-To: <1586609756.10722764.1448275592553.JavaMail.zimbra@datacom.ind.br>
References: <1586609756.10722764.1448275592553.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20151123105110.GN2177@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Henrique,

On Mon, Nov 23, 2015 at 08:46:32AM -0200, DATACOM - henrique.marks wrote:
> I am trying to remove busybox from some platform build, and i am struggling 
> with modprobe. Which package contains modprobe inside buildroot, if i don't 
> want to use busybox ? 

Try the kmod package.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

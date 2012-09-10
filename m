From: Belisko Marek <marek.belisko@gmail.com>
Date: Mon, 10 Sep 2012 11:08:54 +0200
Subject: [Buildroot] Question: exporting
	QWS_KEYBOARD=LinuxInput:/dev/input/event0" hang application
Message-ID: <CAAfyv34dT-531F66fHTx8-Tk7nXP0NkSPx_L2SOYkgc--CucDw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I know this isn't related to buildroot but maybe somehow have same troubles.
I've build simple buildroot rootfs (2012.08 based) with QT4.8.2, my
small qt application
and dropbear.

I can start my application and it is working fine. When need to add
keyboard handling
from USB keyboard application hang (with no useful data in console) that way:
export QWS_KEYBOARD="LinuxInput:/dev/input/event0" ./app -qws

I've double check qt configuration and linuxinput is checked.
Anybody have same troubles?

Thanks.

Marek



-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com

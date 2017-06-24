From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 24 Jun 2017 22:54:11 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-06-23
In-Reply-To: <20170624063043.4336020982@mail.free-electrons.com>
References: <20170624063043.4336020982@mail.free-electrons.com>
Message-ID: <20170624195411.37qp6b5ocvenrjeo@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, list,

On Sat, Jun 24, 2017 at 08:30:43AM +0200, Thomas Petazzoni wrote:
>      aarch64 |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/937c2c1e025bb16ca6fc26bc025ca728ad92bd3b |     
>       x86_64 |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/d397964e0a9b97fcc887143cdeaa02137e92469a |     
>       xtensa |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/dccea3d71f2433f45eca4403343a15d01dda5be7 |     
>      aarch64 |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/af9accf066801b61bc05f0deef0ea6cdf36dabed |     
>         m68k |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/a114fef820ed6e25603ded8594e6930f952cdfa2 |     
>      powerpc |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/e25e8b031a944320c6ab5260220910b03820bfda |     
>        nios2 |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/ee77acba11239511009bd98255599c9ecc043f6c |     
>       mipsel |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/059e916b409e8aac42f565c9eba29bd8fad9cadf |     

>>> openvpn 2.4.3 Downloading
converted 'http://swupdate.openvpn.net/community/releases/openvpn-2.4.3.tar.xz' (ANSI_X3.4-1968) -> 'http://swupdate.openvpn.net/community/releases/openvpn-2.4.3.tar.xz' (UTF-8)
--2017-06-23 22:00:10--  http://swupdate.openvpn.net/community/releases/openvpn-2.4.3.tar.xz

[...]

2017-06-23 22:00:10 (7.26 MB/s) - '/home/buildroot/build/instance-0/output/build/.openvpn-2.4.3.tar.xz.AZpKge/output' saved [929028/929028]

ERROR: openvpn-2.4.3.tar.xz has wrong sha256 hash:
ERROR: expected: 15e15fc97f189b52aee7c90ec8355aa77469c773125110b4c2f089abecde36fb
ERROR: got     : 7aa86167a5b8923e54e8795b814ed77288c793671f59fd830d9ab76d4b480571
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Not sure what is going on here. I have now tried again a fresh download, and 
also compared to the tarball I have in dl/. In both cases I get the expected 
hash. The tarball size here is 938440.

Maybe different downloaders get different tarballs?

What is the content of that tarball?

Does it match the signature[1]?

baruch

[1] https://swupdate.openvpn.org/community/releases/openvpn-2.4.3.tar.xz.asc

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

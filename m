From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 25 Jun 2017 06:13:45 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-06-23
In-Reply-To: <20170624224502.GA8771@shattrath>
References: <20170624063043.4336020982@mail.free-electrons.com>
 <20170624195411.37qp6b5ocvenrjeo@tarshish>
 <20170624223852.7812d38d@windsurf.home>
 <20170624224502.GA8771@shattrath>
Message-ID: <20170625031345.ydexfd4jiapdgifg@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Richard,

On Sun, Jun 25, 2017 at 12:45:02AM +0200, Richard Braun wrote:
> On Sat, Jun 24, 2017 at 10:38:52PM +0200, Thomas Petazzoni wrote:
> > > 2017-06-23 22:00:10 (7.26 MB/s) - '/home/buildroot/build/instance-0/output/build/.openvpn-2.4.3.tar.xz.AZpKge/output' saved [929028/929028]
> > > 
> > > ERROR: openvpn-2.4.3.tar.xz has wrong sha256 hash:
> > > ERROR: expected: 15e15fc97f189b52aee7c90ec8355aa77469c773125110b4c2f089abecde36fb
> > > ERROR: got     : 7aa86167a5b8923e54e8795b814ed77288c793671f59fd830d9ab76d4b480571
> > > ERROR: Incomplete download, or man-in-the-middle (MITM) attack
> > > 
> > > Not sure what is going on here. I have now tried again a fresh download, and 
> > > also compared to the tarball I have in dl/. In both cases I get the expected 
> > > hash. The tarball size here is 938440.
> > > 
> > > Maybe different downloaders get different tarballs?
> > > 
> > > What is the content of that tarball?
> > > 
> > > Does it match the signature[1]?
> > 
> > Indeed, weird. According to
> > http://autobuild.buildroot.net/?reason=openvpn-2.4.3, this only happens
> > on Yann and Richard autobuilder instances. Yann, Richard, could you
> > manually try to download
> > http://swupdate.openvpn.net/community/releases/openvpn-2.4.3.tar.xz,
> > and see what its sha256 hash is?
> 
> $ wget http://swupdate.openvpn.net/community/releases/openvpn-2.4.3.tar.xz
> [...]
> $ sha256sum openvpn-2.4.3.tar.xz 
> 7aa86167a5b8923e54e8795b814ed77288c793671f59fd830d9ab76d4b480571  openvpn-2.4.3.tar.xz

Thanks for checking. Can you verify this tarball against the signature at 
https://swupdate.openvpn.org/community/releases/openvpn-2.4.3.tar.xz.asc ?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

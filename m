From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jan 2016 10:43:13 +0100
Subject: [Buildroot] [git commit] flot: add hash file
In-Reply-To: <rs5uncx00j.ln2@ID-313208.user.individual.net>
References: <20150728204046.4BDD17F9DF@busybox.osuosl.org>
 <rs5uncx00j.ln2@ID-313208.user.individual.net>
Message-ID: <20160131104313.1c5fdd0a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Jan 2016 08:38:35 +0100, Bernd Kuhls wrote:

> I downloaded the tarball
> http://www.flotcharts.org/downloads/flot-0.8.3.tar.gz
> today and got a different sha256 checksum:
> 
> ERROR: flot-0.8.3.tar.gz has wrong sha256 hash:
> ERROR: expected: 
> d6bddb781ce8ab8bba82c535a0767c22e606cabd9dbb484027b8ff375a193952
> ERROR: got     : 
> ef9a873befe3ff5ea42ebf1c3657887265a1717744ca8ed0c2bd3dd736d16b21
> ERROR: Incomplete download, or man-in-the-middle (MITM) attack

I checked locally, and in my BR2_DL_DIR, I still have a tarball that
has the
d6bddb781ce8ab8bba82c535a0767c22e606cabd9dbb484027b8ff375a193952 hash,
but indeed if I re-download it, I get a tarball with the
ef9a873befe3ff5ea42ebf1c3657887265a1717744ca8ed0c2bd3dd736d16b21 hash.

> Shall I send a patch?

Yes, please do. It would also be great to notify upstream that they
shouldn't change their tarballs.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

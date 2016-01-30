From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 08:38:35 +0100
Subject: [Buildroot] [git commit] flot: add hash file
References: <20150728204046.4BDD17F9DF@busybox.osuosl.org>
Message-ID: <rs5uncx00j.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 28 Jul 2015 22:32:55 +0200 schrieb Thomas Petazzoni:

> diff --git a/package/flot/flot.hash b/package/flot/flot.hash new file
> mode 100644 index 0000000..9bf348a --- /dev/null +++
> b/package/flot/flot.hash @@ -0,0 +1,2 @@
> +# Locally calculated +sha256
> d6bddb781ce8ab8bba82c535a0767c22e606cabd9dbb484027b8ff375a193952
> flot-0.8.3.tar.gz

Hi Thomas,

I downloaded the tarball
http://www.flotcharts.org/downloads/flot-0.8.3.tar.gz
today and got a different sha256 checksum:

ERROR: flot-0.8.3.tar.gz has wrong sha256 hash:
ERROR: expected: 
d6bddb781ce8ab8bba82c535a0767c22e606cabd9dbb484027b8ff375a193952
ERROR: got     : 
ef9a873befe3ff5ea42ebf1c3657887265a1717744ca8ed0c2bd3dd736d16b21
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Shall I send a patch?

Regards, Bernd

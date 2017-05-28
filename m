From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 May 2017 21:08:53 +0200
Subject: [Buildroot] [PATCH 1/1] lxc: set libcap as an optional
	dependency
References: <1495203359-57057-1-git-send-email-fontaine.fabrice@gmail.com>
Message-ID: <5rjrvdxfme.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 19 May 2017 16:15:59 +0200 schrieb Fabrice Fontaine:

> --- a/package/lxc/lxc.hash
> +++ b/package/lxc/lxc.hash
> @@ -1,2 +1,3 @@
>  # Locally calculated
>  sha256	
0d8e34b302cfe4c40c6c9ae5097096aa5cc2c1dfceea3f0f22e3e16c4a4e8494	
lxc-2.0.8.tar.gz
> +sha256	
c79443c5db7e7defd53992d120cad2bc8afc2ff363b1e84ec31bc2b95ec5ca44	
bc5b27d6f6d166d2a6df47982cbe36041ce6b735.patch

Hi Fabrice,

there seems to be a problem with the hash:

ERROR: bc5b27d6f6d166d2a6df47982cbe36041ce6b735.patch has wrong sha256 
hash:

ERROR: expected: 
c79443c5db7e7defd53992d120cad2bc8afc2ff363b1e84ec31bc2b95ec5ca44

ERROR: got     : 
16cf466db42a45bd579bdb66efbeb63764cd93d049f05a6d8a659846cab9b47f
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Regards, Bernd

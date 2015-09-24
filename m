From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Date: Thu, 24 Sep 2015 15:00:16 +0200
Subject: [Buildroot] [PATCH 1/1] drbd-utils: bump version to 8.9.4
In-Reply-To: <5603D66C.6050505@imgtec.com>
References: <1442825281-16987-1-git-send-email-cvubrugier@fastmail.fm>
 <5603D66C.6050505@imgtec.com>
Message-ID: <20150924150016.5c412aa0@PAL-U515208D001>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente,

Thank you for your review!

On Thu, 24 Sep 2015 11:54:36 +0100, Vicente Olivert Riera wrote :
> That hash value is wrong:
> 
> ERROR: drbd-utils-8.9.4.tar.gz has wrong sha256 hash:
> ERROR: expected:
> 01a8924f8bc1370fc91e0495989d69b65c3b08346006d614d4b1dbdcd1caade5
> ERROR: got     :
> 38929279d1bf549fd1ade4ce6773a6fe209db51bbb0efe7bf6d2b7871ba0afbc
> 
> Please send an v2 with the right hash value.

That's very surprising, but you are right. The content of the tarball
has changed since I last downloaded it (on Monday 21st). It seems a new
tarball with the same name was released on Tuesday. It contains a set
of fixes committed two days ago:

  http://git.drbd.org/gitweb.cgi?p=drbd-utils.git;a=shortlog

I will respin my patch to fix the checksum and modify the commit
message for Autobuild as you suggested.

Thanks again!

-- 
Christophe Vu-Brugier

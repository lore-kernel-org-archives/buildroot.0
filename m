From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Aug 2019 20:13:21 +0200
Subject: [Buildroot] [PATCH 2/2] package/cloop: bump to version 3.14.1.2
In-Reply-To: <20190801122109.25535-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 1 Aug 2019 14:21:09 +0200")
References: <20190801122109.25535-1-fontaine.fabrice@gmail.com>
 <20190801122109.25535-2-fontaine.fabrice@gmail.com>
Message-ID: <87imrgvjni.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Remove patch, it is not needed anymore as CFLAGS/LDFLAGS are now
 >   correctly passed to extract_compressed_fs. CFLAGS/LDFLAGS are not
 >   passed to cloop_suspend but it isn't built. Moreover original CFLAGS
 >   are lost but this is acceptable)
 > - Switch site to http://snapshot.debian.org/archive/debian as
 >   http://debian-knoppix.alioth.debian.org/packages/sources/cloop is not
 >   available anymore
 > - Add hash for license files

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

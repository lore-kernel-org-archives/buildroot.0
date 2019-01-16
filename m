From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Jan 2019 20:35:38 +0100
Subject: [Buildroot] [PATCH 3/3] gnutls: bump to version 3.6.5
In-Reply-To: <20190116185902.5076-3-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 16 Jan 2019 19:59:02 +0100")
References: <20190116185902.5076-1-fontaine.fabrice@gmail.com>
 <20190116185902.5076-3-fontaine.fabrice@gmail.com>
Message-ID: <87pnswbdkl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - libidn1 support removed since version 3.6.0 and
 >   https://github.com/gnutls/gnutls/commit/abe6a12b9766219163f99d7807a0b07fbe5f590c
 > - libz support has been removed since version 3.6.0 and
 >   https://github.com/gnutls/gnutls/commit/1b3ece44acaa25c149659a6878d2be807a282f02

 > This bump also fix build issues of gnutls tests and applications such
 > as ffmpeg or cups due to the fact that _idn2_punycode_* functions are
 > not exposed anymore since libidn2 bump to version 2.1.0 and:
 > https://github.com/libidn/libidn2/commit/1d1f2e5babe6032eb0fe4d451afee2e277b8419f

 > Fixes:
 >  - http://autobuild.buildroot.org/results/f8c38ea6ebbb78269d620d19d760a0566f742640
 >  - http://autobuild.buildroot.org/results/8dc5b4212b1d8d0bf5bd5e8a27eb02753dc678e4
 >  - http://autobuild.buildroot.org/results/53f5bcd9010c841838f51d65427d9a97ef35e08c

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 02 Apr 2020 21:52:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/libsndfile: add upstream
 security fixes
In-Reply-To: <20200330221719.1371791-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 31 Mar 2020 00:17:19 +0200")
References: <20200330221719.1371791-1-fontaine.fabrice@gmail.com>
Message-ID: <87lfnd8y2q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2017-6892: In libsndfile version 1.0.28, an error in the
 >   "aiff_read_chanmap()" function (aiff.c) can be exploited to cause an
 >   out-of-bounds read memory access via a specially crafted AIFF file.

 > - Fix CVE-2017-8361: The flac_buffer_copy function in flac.c in
 >   libsndfile 1.0.28 allows remote attackers to cause a denial of service
 >   (buffer overflow and application crash) or possibly have unspecified
 >   other impact via a crafted audio file.

 > - Fix CVE-2017-8362: The flac_buffer_copy function in flac.c in
 >   libsndfile 1.0.28 allows remote attackers to cause a denial of service
 >   (invalid read and application crash) via a crafted audio file.

 > - Fix CVE-2017-8363: The flac_buffer_copy function in flac.c in
 >   libsndfile 1.0.28 allows remote attackers to cause a denial of service
 >   (heap-based buffer over-read and application crash) via a crafted
 >   audio file.

 > - Fix CVE-2017-8365: The i2les_array function in pcm.c in
 >   libsndfile 1.0.28 allows remote attackers to cause a denial of service
 >   (buffer over-read and application crash) via a crafted audio file.

 > - Fix CVE-2017-12562: Heap-based Buffer Overflow in the
 >   psf_binheader_writef function in common.c in libsndfile through 1.0.28
 >   allows remote attackers to cause a denial of service (application
 >   crash) or possibly have unspecified other impact.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

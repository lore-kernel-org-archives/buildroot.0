From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 19:45:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/openjpeg: fix CVE-2020-15389
In-Reply-To: <20200827204012.146472-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 27 Aug 2020 22:40:12 +0200")
References: <20200827204012.146472-1-fontaine.fabrice@gmail.com>
Message-ID: <87ft86oe9p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2020-15389: jp2/opj_decompress.c in OpenJPEG through 2.3.1 has a
 > use-after-free that can be triggered if there is a mix of valid and
 > invalid files in a directory operated on by the decompressor. Triggering
 > a double-free may also be possible. This is related to calling
 > opj_image_destroy twice.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard

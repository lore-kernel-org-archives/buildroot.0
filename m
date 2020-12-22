From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Dec 2020 11:54:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/imagemagick: security bump to
 version 7.10.51
In-Reply-To: <20201220222001.128092-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 20 Dec 2020 23:20:01 +0100")
References: <20201220222001.128092-1-fontaine.fabrice@gmail.com>
Message-ID: <87blemkt5b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2020-29599: ImageMagick before 6.9.11-40 and 7.x before
 >   7.0.10-40 mishandles the -authenticate option, which allows setting a
 >   password for password-protected PDF files. The user-controlled password
 >   was not properly escaped/sanitized and it was therefore possible to
 >   inject additional shell commands via coders/pdf.c.
 > - Update license hash (correct wording to match Apache 2 license:
 >   https://github.com/ImageMagick/ImageMagick/commit/45e5d2493c08e7cb49f7268c01d847e88f78fd6c)

 > https://github.com/ImageMagick/ImageMagick/blob/7.0.10-51/ChangeLog

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, 2020.08.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard

From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Jan 2017 21:59:27 +0100
Subject: [Buildroot] [PATCH] uclibc: add locale/iconv related bugfixes
In-Reply-To: <20161229162140.GA16893@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Thu, 29 Dec 2016 17:21:40 +0100")
References: <20161229162140.GA16893@waldemar-brodkorb.de>
Message-ID: <8737gtqndc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > - do not remove iconv.h when UCLIBC_HAS_LOCALE enabled
 > - select UCLIBC_HAS_LIBICONV when UCLIBC_HAS_LOCALE enabled

 > Fixes:
 >    http://autobuild.buildroot.net/?reason=libglib2-2.50.2&step=250

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard

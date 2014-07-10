From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Jul 2014 14:40:38 +0200
Subject: [Buildroot] [PATCH v3] use default binutils for sh architecture
In-Reply-To: <20140702153153.GA29927@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Wed, 2 Jul 2014 17:31:53 +0200")
References: <20140702153153.GA29927@waldemar-brodkorb.de>
Message-ID: <87a98hqtdl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Tested toolchain compiles with binutils 2.22 and 2.24.
 > Result tested in Qemu 2.0.0. (only little endian version
 > tested)

 > ---
 >  Changes v2 -> v3:
 >    - sync with upstream changes

Committed (with your s-o-b added), thanks.

-- 
Bye, Peter Korsgaard

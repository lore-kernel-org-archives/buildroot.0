From: BEREGNYEI Balazs <bereg@impulzus.com>
Date: Fri, 15 Oct 2010 10:03:33 +0200 (CEST)
Subject: [Buildroot] wvdial
Message-ID: <Pine.LNX.4.64.1010151000001.12094@impulzus.bercsenyi.bme.hu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

How can I integrate wvdial package to buildroot?
I tried to compile wvdial-1.60.3 and wvstreams-4.6.1, it works only with 
i386 gcc, but doesn't works with buildroot generated arm cross-gcc:

linking libwvbase.so...
./CXX -c utils/strcrypt
./CXX -c utils/wvargs  -Iargp
In file included from utils/wvargs.cc:18:
argp/argp.h: In function ?void argp_usage(const argp_state*)?:
argp/argp.h:567: error: declaration of ?void argp_usage(const 
argp_state*)? throws different exceptions
argp/argp.h:494: error: from previous declaration ?void argp_usage(const 
argp_state*) throw ()?

Can anybody help me?
Thanks,
BB

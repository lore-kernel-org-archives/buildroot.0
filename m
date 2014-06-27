From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 27 Jun 2014 08:54:19 +0200
Subject: [Buildroot] [PATCH 52/54] protobuf-c: update license information
In-Reply-To: <1403636160-11807-52-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 24 Jun 2014 15:55:58 -0300")
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
 <1403636160-11807-52-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ionmn8pw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/protobuf-c/protobuf-c.mk | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
 > index da0b139..7cfc2e1 100644
 > --- a/package/protobuf-c/protobuf-c.mk
 > +++ b/package/protobuf-c/protobuf-c.mk
 > @@ -12,6 +12,7 @@ PROTOBUF_C_MAKE = $(MAKE1)
 >  PROTOBUF_C_CONF_OPT = --disable-protoc
 >  PROTOBUF_C_INSTALL_STAGING = YES
 >  PROTOBUF_C_LICENSE = BSD-3c
 > +PROTOBUF_C_LICENSE_FILES = LICENSE

Looking at the license I see that it is actually BSD-2c, so I've updated
that as well and committed, thanks.

-- 
Bye, Peter Korsgaard

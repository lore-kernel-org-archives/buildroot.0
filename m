From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 23 Jan 2014 14:56:10 +0100
Subject: [Buildroot] [PATCH] lua: fix compilation with Blackfin FLAT
In-Reply-To: <CAB0FRssis3vYqKjeGPxdXiA2YXM9w0ecXNOqcc+7g3CWH1BJQw@mail.gmail.com>
 (=?utf-8?Q?=22Fran=C3=A7ois?= Perrad"'s message of "Thu, 23 Jan 2014
 13:59:41 +0100")
References: <1390389214-9768-1-git-send-email-francois.perrad@gadz.org>
 <87ob33d8x3.fsf@dell.be.48ers.dk>
 <CAB0FRste2wME45HZCXaCrVD3zB=bJ8mSB6b3wSk5VTQvs8eycQ@mail.gmail.com>
 <87lhy7aq54.fsf@dell.be.48ers.dk>
 <CAB0FRssis3vYqKjeGPxdXiA2YXM9w0ecXNOqcc+7g3CWH1BJQw@mail.gmail.com>
Message-ID: <874n4uby4l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fran?ois" == Fran?ois Perrad <francois.perrad@gadz.org> writes:

Hi,

 >> What you perhaps mean is that there is a difference between
 >> architectures (or variants) where we select BR2_PREFER_STATIC_LIB
 >> because they cannot support shared libraries (and hence have no
 >> dlopen/dlclose/dlsym), and other situations where the USER just desides
 >> that they don't want shared libraries, even if the architecture could
 >> support it.

 > Yes, BR2_PREFER_STATIC_LIB is mostly a user choice, when
 > BR2_BINFMT_FLAT is an architecture limitation.

But why should lua care? If buildroot is configured to use static
libraries, then that's what it should do.

-- 
Bye, Peter Korsgaard

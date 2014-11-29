From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Nov 2014 12:25:34 +0100
Subject: [Buildroot] [PATCH] perl-gd: fix configure/build
In-Reply-To: <CAGhdn56p-WpX1w6A5hxos+DjSdaHVzZGHUsi0342xnBBXZDSKw@mail.gmail.com>
 (=?utf-8?Q?=22Fran=C3=A7ois?= Perrad"'s message of "Sat, 29 Nov 2014
 10:50:59 +0100")
References: <1417195423-17839-1-git-send-email-francois.perrad@gadz.org>
 <8761dzkqbe.fsf@dell.be.48ers.dk>
 <CAGhdn56p-WpX1w6A5hxos+DjSdaHVzZGHUsi0342xnBBXZDSKw@mail.gmail.com>
Message-ID: <87k32ejljl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fran?ois" == Fran?ois Perrad <fperrad@gmail.com> writes:

Hi,

 >> > + sub try_to_autoconfigure {
 >> > ++  return; # hack for BR
 >> 
 >> But does that do the right thing?
 >> 
 > with this patch, gdlib-config is never called, the configure step uses only
 > values from PERL_GD_CONF_OPTS.

Yes, exactly. Does it end up linking with the right libraries flags
(-pthread -ljpeg -lz -lm)?

-- 
Venlig hilsen,
Peter Korsgaard 

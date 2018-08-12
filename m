From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 14:13:36 +0200
Subject: [Buildroot] [PATCH 06/17] perl-module-runtime: add host
In-Reply-To: <CAB0FRssyWKMjxCeX9WHg7K-P5A97W32X4Qr=S8EvMOTBovn5LA@mail.gmail.com>
References: <20180811182749.20924-1-chrismcc@gmail.com>
 <20180811182749.20924-7-chrismcc@gmail.com>
 <CAB0FRssyWKMjxCeX9WHg7K-P5A97W32X4Qr=S8EvMOTBovn5LA@mail.gmail.com>
Message-ID: <20180812141336.0621e01e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

(Thanks for reviewing the Perl patches, definitely very useful!)

On Sun, 12 Aug 2018 11:21:07 +0200, Fran?ois Perrad wrote:
> Most of the time, host-perl-* packages are useless on BuildRoot,
> please, double check the package which introduces this dependency.

For which specific patches are you giving this comment ? Does it also
apply to host-perl-cgi, host-perl-html-parser and
host-perl-html-tagset ?

Also Fran?ois, it is very good when you make comments on patches that
have issues, but it would be even better if you could provide your
Reviewed-by/Acked-by on the patches that look correct to you. This
gives me a sign that you are OK with a specific patch, so that I can
merge it, and reduce the backlog of patches.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

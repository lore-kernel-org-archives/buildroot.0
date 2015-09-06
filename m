From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Sep 2015 15:53:39 +0200
Subject: [Buildroot] [PATCH 2/3] uclibc: fix coreutils cut bug,
 enable needed config symbols
In-Reply-To: <87vbbnk6xn.fsf@dell.be.48ers.dk>
References: <20150905152423.GA23237@waldemar-brodkorb.de>
 <878u8jlwlg.fsf@dell.be.48ers.dk>
 <20150906152647.3094d7f3@free-electrons.com>
 <87vbbnk6xn.fsf@dell.be.48ers.dk>
Message-ID: <20150906155339.734b025a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Sun, 06 Sep 2015 15:34:28 +0200, Peter Korsgaard wrote:

>  >> I slightly tweaked the description to make it clear this is for
>  >> uClibc-ng and committed, thanks.
> 
>  > This is not only for uClibc-ng, it should also be done in
>  > uClibc-0.9.33.config and uClibc-snapshot.config, as far as I understand.
> 
> Possibly, but that was not what the patch did.

Well, that's precisely what I'm saying: you changed the commit log to
"make it clear it's for uclibc-ng", and I'm saying that the issue is
not uClibc-ng specific. It also applies to other uClibc versions.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Sep 2015 15:26:47 +0200
Subject: [Buildroot] [PATCH 2/3] uclibc: fix coreutils cut bug,
 enable needed config symbols
In-Reply-To: <878u8jlwlg.fsf@dell.be.48ers.dk>
References: <20150905152423.GA23237@waldemar-brodkorb.de>
 <878u8jlwlg.fsf@dell.be.48ers.dk>
Message-ID: <20150906152647.3094d7f3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Waldemar,

On Sun, 06 Sep 2015 11:34:51 +0200, Peter Korsgaard wrote:
> >>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:
> 
>  > Fixes https://bugs.buildroot.org/show_bug.cgi?id=4099
>  > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> 
> I slightly tweaked the description to make it clear this is for
> uClibc-ng and committed, thanks.

This is not only for uClibc-ng, it should also be done in
uClibc-0.9.33.config and uClibc-snapshot.config, as far as I understand.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

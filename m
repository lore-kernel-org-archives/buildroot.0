From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 06 Oct 2010 17:15:56 +0200
Subject: [Buildroot] [git commit master 1/1] package: add libmpeg2
In-Reply-To: <20101006155307.574dcfb9@surf> (Thomas Petazzoni's message of
	"Wed, 6 Oct 2010 15:53:07 +0200")
References: <20101006103554.2176D8B7C6@busybox.osuosl.org>
	<20101006155307.574dcfb9@surf>
Message-ID: <87aamrqrmb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> On Wed, 6 Oct 2010 11:48:58 +0200
 Thomas> Peter Korsgaard <jacmet@sunsite.dk> wrote:

 >> +config BR2_PACKAGE_LIBMPEG2_BINS
 >> +       bool "mpeg2 binaries"
 >> +       depends on BR2_PACKAGE_LIBMPEG2
 >> +       help
 >> +         Install mpeg2dec, corrupt_mpeg2 and extrac_mpeg2 programs as
 >> +	 well.

 Thomas> Tiny typos here: extracT_mpeg2 and incorrect indentation.

Argh, you're right - Will fix right away.

Seems I need more coffee.

-- 
Bye, Peter Korsgaard

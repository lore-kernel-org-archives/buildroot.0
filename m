From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 Jul 2010 23:09:17 +0200
Subject: [Buildroot] build failed - cannot stat libz.so*
In-Reply-To: <20100727211845.1941d75a@surf> (Thomas Petazzoni's message of
	"Tue, 27 Jul 2010 21:18:45 +0200")
References: <20100727190310.GA10996@merkur.ravnborg.org>
	<20100727211845.1941d75a@surf>
Message-ID: <87y6cwbpj6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Do you have a particular reason for using static libraries ?

 Thomas> Peter, do we want to support static libraries ?

ideally yes, if we can find manpower to do so. It's quite nice for the
initramfs case.

But Thomas is right, we don't support it properly today. I believe Sam
is using it because the shared lib stuff on Sparc is broken in uclibc.

-- 
Bye, Peter Korsgaard

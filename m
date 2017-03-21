From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Mar 2017 17:28:36 +0100
Subject: [Buildroot] [git commit] Makefile: add check of binaries
	architecture
In-Reply-To: <877f3imwcd.fsf@dell.be.48ers.dk>
References: <20170320212621.499227FB10@busybox.osuosl.org>
 <877f3imwcd.fsf@dell.be.48ers.dk>
Message-ID: <20170321172836.69a3026c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Mar 2017 17:24:34 +0100, Peter Korsgaard wrote:

> Sorry for the late response (nice feature!), but doesn't this get very
> confused if any package ever install any files with spaces or special
> characters?

Yes, this would mess up if files have spaces in their names. I'll have
to think about how to handle this. Suggestions from shell gurus are
welcome, of course :)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

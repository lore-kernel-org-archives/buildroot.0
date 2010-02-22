From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Feb 2010 20:22:18 +0100
Subject: [Buildroot] [PATCH 17/38] libxml-parser-perl: new package
In-Reply-To: <87fx4ti6q0.fsf@macbook.be.48ers.dk>
References: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
	<cover.1266774432.git.thomas.petazzoni@free-electrons.com>
	<fac4d6f24ebf9312fd1c7a714100c4e2a859e647.1266774432.git.thomas.petazzoni@free-electrons.com>
	<87fx4ti6q0.fsf@macbook.be.48ers.dk>
Message-ID: <20100222202218.29917c34@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 22 Feb 2010 17:19:03 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

> Missing newline.
> 
> It should presumably select EXPAT?

Yes.

>  Thomas> +HOST_LIBXML_PARSER_PERL_DEPENDENCIES = host-expat
> 
> And have a similar line for the TARGET.

Yes.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

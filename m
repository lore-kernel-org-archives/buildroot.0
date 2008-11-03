From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 03 Nov 2008 11:48:27 +0100
Subject: [Buildroot] Problem with program_transform_name and naming of
	installed binaries
In-Reply-To: <20081031144326.24ce23c1@surf> (Thomas Petazzoni's message of
	"Fri\, 31 Oct 2008 14\:43\:26 +0100")
References: <20081031113307.14125656@surf> <20081031144326.24ce23c1@surf>
Message-ID: <87iqr5hypw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> It seems that by default, the binary names are transformed to be
 Thomas> prefixed with the target name, which is what I see. Should we add
 Thomas> --program-prefix= and --program-transform-name= to the CONFIGURE_OPTS ?

I haven't seen the issue here (don't use directfb), but if it solves
the problem and doesn't cause any other issues I say go for it.

-- 
Bye, Peter Korsgaard

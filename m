From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 29 Aug 2010 20:27:49 +0200
Subject: [Buildroot] [git commit master 1/1] Config.in: mark
	BR2_CONFIG_CACHE as experimental and disable by default
In-Reply-To: <20100829115812.17ac0bb5@surf> (Thomas Petazzoni's message of
	"Sun, 29 Aug 2010 11:58:12 +0200")
References: <20100825153147.4915689016@busybox.osuosl.org>
	<20100829115812.17ac0bb5@surf>
Message-ID: <87eidhz32y.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> On Wed, 25 Aug 2010 17:30:38 +0200
 Thomas> Peter Korsgaard <jacmet@sunsite.dk> wrote:

 >> commit:
 >> http://git.buildroot.net/buildroot/commit/?id=b680672ad1b1c45e23cf89ddb217616274d68dee
 >> branch:
 >> http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
 >> 
 >> As it is known to break with certain package combinations.


 Thomas> Can we take some sort of official decision about this ?
 Thomas> Supporting the configuration cache thing is not just having an
 Thomas> option or not, it's also all the patches that we're adding to
 Thomas> fix the issues found here and there (libglib2, lzo, etc.).

It would be nice to keep it, but I honestly think the only realistic
option is to get rid of it completely.

I'll keep the patches for now for 2010.08, but we can start removing
stuff afterwards.

Unless anyone disagrees?

-- 
Bye, Peter Korsgaard

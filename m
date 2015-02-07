From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 07 Feb 2015 08:09:59 +0100
Subject: [Buildroot] [git commit] lame: unconditionally disable debug
	handling
In-Reply-To: <20150207072103.07347436@free-electrons.com> (Thomas Petazzoni's
 message of "Sat, 7 Feb 2015 07:21:03 +0100")
References: <20150206214705.7E8C47F921@busybox.osuosl.org>
 <20150207072103.07347436@free-electrons.com>
Message-ID: <87r3u28aew.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > To be honest, I continue to wonder if BR2_ENABLE_DEBUG should really
 > pass --enable-debug to all packages, instead of just passing -g to
 > enable debugging symbols.

Yes, I'm also not sure. I have personally never had a need for anything
extra enabled by --enable-debug.

-- 
Bye, Peter Korsgaard 

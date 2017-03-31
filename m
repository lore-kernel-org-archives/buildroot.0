From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 10:22:26 +0200
Subject: [Buildroot] [git commit] system: do not overwrite /bin/sh
	Busybox symlink
In-Reply-To: <20170331092524.5912de2c@free-electrons.com> (Thomas Petazzoni's
 message of "Fri, 31 Mar 2017 09:25:24 +0200")
References: <20170329212901.DE1518265E@busybox.osuosl.org>
 <87h929x6l9.fsf@dell.be.48ers.dk>
 <20170331092524.5912de2c@free-electrons.com>
Message-ID: <878tnlx3ct.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 >> > Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 >> > Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 >> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  
 >> 
 >> Committed to 2017.02.x, thanks.

 > I don't think this one was needed for the LTS branch. Really it's not a
 > fix. This patch is only useful for the support of installing Busybox as
 > individual binaries, which will anyway not go into the LTS branch.

Ahh yes, you're right. Sorry about that. It shouldn't really hurt
though.

-- 
Bye, Peter Korsgaard

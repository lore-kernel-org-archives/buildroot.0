From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 12 Mar 2016 10:52:58 +0100
Subject: [Buildroot] [PATCH 1/1] olimex_imx233_olinuxino_defconfig:
	genimage support
In-Reply-To: <56E3E205.8090701@mind.be> (Arnout Vandecappelle's message of
 "Sat, 12 Mar 2016 10:31:49 +0100")
References: <1457645651-2472-1-git-send-email-phil@zankapfel.net>
 <87shzxi54b.fsf@dell.be.48ers.dk> <56E3E205.8090701@mind.be>
Message-ID: <87vb4sggzp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 03/11/16 13:14, Peter Korsgaard wrote:
 >>>>>>> "Phil" == Phil Eichinger <phil.eichinger@gmail.com> writes:
 > [snip]
 >> > +# To generate SD Image
 >> > +BR2_PACKAGE_HOST_GENIMAGE=y
 >> > +BR2_PACKAGE_HOST_MTOOLS=y
 >> 
 >> The vfat handling also uses mkdosfs, so we need to add
 >> BR2_PACKAGE_HOST_DOSFSTOOLS=y as well.
 >> 
 >> I noticed that we are missing it from some of the other defconfigs as
 >> well, so I'll fix that.

 >  So, why doesn't Travis detect that?

Presumably because the Ubuntu container has mkdosfs installed?

-- 
Venlig hilsen,
Peter Korsgaard 

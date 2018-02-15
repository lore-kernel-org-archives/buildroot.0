From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Feb 2018 22:09:23 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/ffmpeg: bump version to
 3.4.2
In-Reply-To: <q3vglex27m.ln2@ID-313208.user.individual.net> (Bernd Kuhls's
 message of "Thu, 15 Feb 2018 19:11:38 +0100")
References: <20180212165106.18383-1-bernd.kuhls@t-online.de>
 <87tvuimsab.fsf@dell.be.48ers.dk>
 <q3vglex27m.ln2@ID-313208.user.individual.net>
Message-ID: <87h8qim03g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Am Thu, 15 Feb 2018 12:00:28 +0100 schrieb Peter Korsgaard:
 >> > -FFMPEG_VERSION = 3.4.1 +FFMPEG_VERSION = 3.4.2
 >> 
 >> Is this not 'master' material? Doesn't this only contain bugfixes
 >> relative to 3.4.1?

 > Hi Peter,

 > according to the changelog http://git.videolan.org/?
 > p=ffmpeg.git;a=blob;f=Changelog;h=5db7b0a8a7643bc0a9a310fc642c84e003300a8a;hb=refs/
 > heads/release/3.4 it looks like the release only contains bugfixes, but 
 > afaics, nothing security related.

 > Whether this patch should be committed to master or next branch when we 
 > are in -rc phase is a question I am unable to answer, I thought that only 
 > security bumps to the master branch are allowed during the rc phase. Did 
 > this change?

Well, the idea is to not add any new features after RC1, but
(security-)bugfixes are fine, so I believe this is OK for master as
well, especially as we are quite early in the RC phase.

I'll cherry pick it to master, thanks.

-- 
Bye, Peter Korsgaard

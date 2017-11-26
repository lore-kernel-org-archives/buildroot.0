From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 22:36:24 +0100
Subject: [Buildroot] [PATCH v2] libpjsip: fix static build failures due
 to name clash
In-Reply-To: <1510441591-10698-1-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Sun, 12 Nov 2017 00:06:31 +0100")
References: <1510441591-10698-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <87609wen8n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > Several packages have a similar md5.c file, and each has a function
 > named byteReverse(). This generates link errors when building
 > statically ("multiple definition of `byteReverse'").

 > Fix by applying a patch from upstream:
 >   https://trac.pjsip.org/repos/changeset/5688

 > Fixes:
 >   http://autobuild.buildroot.org/results/5d7/5d72e0f8517a555399978d5a0e9f7efd0a278189/
 >   http://autobuild.buildroot.org/results/c47/c47ccbb9b40011cf0d79c7040bed061ddefd9629/
 >   http://autobuild.buildroot.org/results/419/419ab2c0e034cc68991281c51caa8271b0fadbab/

 > Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
 > Cc: Adam Duskett <aduskett@gmail.com>

 > ---

 > Changes v1 -> v2:
 >  - Add commit message and SoB line to patch file (Arnout)

Committed to 2017.02.x and 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard

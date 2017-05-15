From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 20:15:56 +0200
Subject: [Buildroot] [PATCH next] ffmpeg: bump version to 3.3.1
In-Reply-To: <20170515122543.29566-1-Vincent.Riera@imgtec.com> (Vicente
 Olivert Riera's message of "Mon, 15 May 2017 13:25:43 +0100")
References: <20170515122543.29566-1-Vincent.Riera@imgtec.com>
Message-ID: <87r2zq9ear.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > ---
 >  package/ffmpeg/ffmpeg.hash | 2 +-
 >  package/ffmpeg/ffmpeg.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
 > index e243acc74..ab7ba5eee 100644
 > --- a/package/ffmpeg/ffmpeg.hash
 > +++ b/package/ffmpeg/ffmpeg.hash
 > @@ -1,2 +1,2 @@
 >  # Locally calculated
 > -sha256 599e7f7c017221c22011c4037b88bdcd1c47cd40c1e466838bc3c465f3e9569d  ffmpeg-3.3.tar.xz
 > +sha256 b702a7fc656ac23e276b8c823a2f646e4e6f6309bb2788435a708e69bea98f2f  ffmpeg-3.3.1.tar.xz
 > diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
 > index 10e4e74d7..d69923b84 100644
 > --- a/package/ffmpeg/ffmpeg.mk
 > +++ b/package/ffmpeg/ffmpeg.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -FFMPEG_VERSION = 3.3
 > +FFMPEG_VERSION = 3.3.1

Looking at the Changelog this seems to only contain fixes, so as we're
still only at rc1 I think it makes sense to add this to master:

https://git.ffmpeg.org/gitweb/ffmpeg.git/blobdiff/ff1f181178fff32eb96b80dce2d0f6e22b3dbaec..c1c50650df6cef69c392ad0d544c30e571e24214:/Changelog

Committed, thanks.

-- 
Bye, Peter Korsgaard

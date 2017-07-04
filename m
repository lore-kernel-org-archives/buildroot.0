From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Jul 2017 12:14:42 +0200
Subject: [Buildroot] [PATCH v2 next 07/11] gst1-plugins-base: bump
	version to 1.12.0
In-Reply-To: <20170512101807.42378-7-Vincent.Riera@imgtec.com> (Vicente
 Olivert Riera's message of "Fri, 12 May 2017 11:18:03 +0100")
References: <20170512101807.42378-1-Vincent.Riera@imgtec.com>
 <20170512101807.42378-7-Vincent.Riera@imgtec.com>
Message-ID: <87inj84igd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Remove non-existant or unnecessary configure options:
 >   --disable-oggtest, --disable-vorbistest:
 >     It looks like these options will be taken into account by ogg.m4 and
 >     vorbis.m4 only when ogg and vobis are enabled. However, according to
 >     the code on those m4 files these two options are disabled by default.

 >   --disable-gio_unix_2_0:
 >     I don't know where this option comes from.

 >   --disable-freetypetest:
 >     https://github.com/GStreamer/gst-plugins-base/commit/183610c035dd6955c9b3540b940aec50474af031

rawparse (moved from bad) is also new, so I've added that and committed.

-- 
Bye, Peter Korsgaard

From: Peter Korsgaard <peter.korsgaard@barco.com>
Date: Mon, 06 Nov 2006 14:30:06 +0100
Subject: [Buildroot] Persistent tarball repository
In-Reply-To: <loom.20061101T151612-639@post.gmane.org> (MikeW's message of
	"Wed, 1 Nov 2006 14:23:36 +0000 (UTC)")
References: <loom.20061101T151612-639@post.gmane.org>
Message-ID: <87y7qozorl.fsf@sleipner.barco.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == MikeW  <mw_phil@yahoo.co.uk> writes:

Hi,

Mike> May I ask if there is a setting to allow these files to be
Mike> cached somewhere that 'distclean' doesn't clear out ?  Might
Mike> also be useful on a server in a team environment to ensure
Mike> everyone uses the same reference downloads without local
Mike> duplication and time penalty.

We use a shared dl directory on a NFS server (setting
BR2_DL_DIR). Make distclean doesn't delete that.

-- 
Bye, Peter Korsgaard

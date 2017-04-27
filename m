From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Apr 2017 15:28:12 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/libqmi: bump version to
	1.18.0
In-Reply-To: <1493297522-20545-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Thu, 27 Apr 2017 07:52:02 -0500")
References: <1493297522-20545-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <87tw5aj7yr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > udev support was added with this bump, however
 > the support was disabled, as Buildroot currently
 > doesn't support the gudev package.  libqmi is
 > looking for the Gobject bindings provided by
 > that package to access libudev.

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

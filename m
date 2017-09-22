From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Sep 2017 18:19:40 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/opencv: bump version to
	2.4.13.3
In-Reply-To: <20170917172322.12997-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 17 Sep 2017 19:23:22 +0200")
References: <20170917172322.12997-1-bernd.kuhls@t-online.de>
Message-ID: <87fuber9ib.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Removed 0002-avoid-sysctl_h.patch, applied upstream:
 > https://github.com/opencv/opencv/commit/61936eb1a43e732e4bc1c75b63e6cab85c6f9e94#diff-f3b4393df86251f502cee9ba1da034a5

 > This bump includes
 > https://github.com/opencv/opencv/commit/70489b1e2232ead1701519e35d151670b74c3f70#diff-9076fba682f6d51a018b6de8648e1cdb
 > which fixes ffmpeg static linking
 > http://autobuild.buildroot.net/results/544/5444b0c5556a42923e3fcdae782811a805e51b1f/
 > http://autobuild.buildroot.net/results/44d/44d53e4c5d4570507c7e8856fb9dd0a477dcdf63/

 > In-source-builds are not allowed anymore:
 > https://github.com/opencv/opencv/commit/777a0080cbdb98761853519b3f45136727a855c2

 > Re-numbered remaining patches.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > v2: squashed v1 with http://patchwork.ozlabs.org/patch/780432/ and added
 >     note that this bump also fixes an autobuild error (Thomas)

Committed, thanks.

-- 
Bye, Peter Korsgaard

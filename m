From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 Jan 2017 16:25:25 +0100
Subject: [Buildroot] [PATCH] imagemagick: bump version to 7.0.4-3
	(security)
In-Reply-To: <20170109143440.441-1-Vincent.Riera@imgtec.com> (Vicente Olivert
 Riera's message of "Mon, 9 Jan 2017 14:34:40 +0000")
References: <20170109143440.441-1-Vincent.Riera@imgtec.com>
Message-ID: <8760lontlm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Fixes CVE-2016-8707 (Fix possible buffer overflow when writing
 > compressed TIFFS). This CVE fix is included since 7.0.3-9:
 >   http://git.imagemagick.org/repos/ImageMagick/commit/fde5f55af94f189f16958535a9c22b439d71ac93

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

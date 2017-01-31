From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 31 Jan 2017 23:50:53 +0100
Subject: [Buildroot] [PATCH] imagemagick: bump version to 7.0.4-6
In-Reply-To: <20170131161731.27870-1-Vincent.Riera@imgtec.com> (Vicente
 Olivert Riera's message of "Tue, 31 Jan 2017 16:17:31 +0000")
References: <20170131161731.27870-1-Vincent.Riera@imgtec.com>
Message-ID: <8737fyrghe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Same as for cjson, this fixes a (potential) security issue:

https://github.com/ImageMagick/ImageMagick/issues/362

Committed, thanks.

-- 
Bye, Peter Korsgaard

From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 21:32:38 +0200
Subject: [Buildroot] [PATCH] libcurl: bump version to 7.54.0 (security)
In-Reply-To: <20170419090742.33430-1-Vincent.Riera@imgtec.com> (Vicente
 Olivert Riera's message of "Wed, 19 Apr 2017 10:07:42 +0100")
References: <20170419090742.33430-1-Vincent.Riera@imgtec.com>
Message-ID: <87inlttxd5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Security fixes:
 >  - CVE-2017-7468: switch off SSL session id when client cert is used

 > Full changelog: https://curl.haxx.se/changes.html

 > Removing 0001-CVE-2017-7407.patch. It's included in this release:
 >   https://github.com/curl/curl/commit/1890d59905414ab84a35892b2e45833654aa5c13

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard

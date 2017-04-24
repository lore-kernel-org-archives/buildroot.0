From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 21:19:46 +0200
Subject: [Buildroot] [PATCH] dovecot: bump version to 2.2.29.1 (security)
In-Reply-To: <20170412155647.15077-1-Vincent.Riera@imgtec.com> (Vicente
 Olivert Riera's message of "Wed, 12 Apr 2017 16:56:47 +0100")
References: <20170412155647.15077-1-Vincent.Riera@imgtec.com>
Message-ID: <87d1c1y5nx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Security fix:
 >   passdb/userdb dict: Don't double-expand %variables in keys. If dict
 >   was used as the authentication passdb, using specially crafted
 >   %variables in the username could be used to cause DoS (CVE-2017-2669)

 > Full ChangeLog 2.2.29 (including CVE fix):
 >   https://www.dovecot.org/list/dovecot-news/2017-April/000341.html

 > Full ChangeLog 2.2.29.1 (some fixes forgotten in the 2.2.29 release):

 >   https://www.dovecot.org/list/dovecot-news/2017-April/000344.html

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard

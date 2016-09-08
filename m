From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 08 Sep 2016 19:46:48 +0200
Subject: [Buildroot] [PATCH] wireshark: bump version to 2.2.0
In-Reply-To: <1473330154-8572-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Thu, 8 Sep 2016 11:22:34 +0100")
References: <1473330154-8572-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87r38u708n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > - Adapt current patch for 2.2.0.
 > - Adapt gtk configure options for 2.2.0:
 >   - Instead of --enable-gtk3 or --enable-gtk2, now it uses
 >     --enable-gtk=[no/2/3/yes].

 > - Remove non-existen configure options:
 >   - --enable-usr-local: removed by
 >     https://code.wireshark.org/review/gitweb?p=wireshark.git;a=commit;h=125989780ba8e658ad0d1f1c71ec01e6d36a2266

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

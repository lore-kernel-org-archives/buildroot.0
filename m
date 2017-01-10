From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Jan 2017 21:03:48 +0100
Subject: [Buildroot] [PATCH 2/2] php: bump version to 7.1.0 (security)
In-Reply-To: <20170109171334.57406-2-Vincent.Riera@imgtec.com> (Vicente
 Olivert Riera's message of "Mon, 9 Jan 2017 17:13:34 +0000")
References: <20170109171334.57406-1-Vincent.Riera@imgtec.com>
 <20170109171334.57406-2-Vincent.Riera@imgtec.com>
Message-ID: <87ziiyk7h7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Fixed CVEs:
 >  - CVE-2016-9933 (imagefilltoborder stackoverflow on truecolor images)
 >    http://bugs.php.net/72696
 >  - CVE-2016-9934 (NULL Pointer Dereference in WDDX Packet
 >    Deserialization with PDORow)
 >    http://bugs.php.net/73331

 > Full ChangeLog:
 >   http://php.net/ChangeLog-7.php#7.1.0

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

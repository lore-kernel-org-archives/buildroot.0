From: Patryk Benderz <Patryk.Benderz@esp.pl>
Date: Tue, 19 Apr 2011 09:28:31 +0200
Subject: [Buildroot] creating skeleton during build
In-Reply-To: <264265.10486.qm@web132205.mail.ird.yahoo.com>
References: <264265.10486.qm@web132205.mail.ird.yahoo.com>
Message-ID: <1303198111.7377.6.camel@esp-patben-lin.espdx1.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[cut]
> build. Any way to avoid this?
Maybe try to make fresh build and let BR populate it's own skeleton.
After that overwrite 'target' directory with your skeleton. AFAIK BR
doesn't bother to validate 'target' dir after first build. At least
until 2011-03-31 snapshot.
-- 
Patryk "LeadMan" Benderz
Linux Registered User #377521
()  ascii ribbon campaign - against html e-mail 
/\  www.asciiribbon.org   - against proprietary attachments

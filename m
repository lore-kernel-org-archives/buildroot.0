From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 19:33:57 +0100
Subject: [Buildroot] [PATCH 2/2] package/pure-ftpd: fix CVE-2020-9365
In-Reply-To: <20200229203416.3462566-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 29 Feb 2020 21:34:16 +0100")
References: <20200229203416.3462566-1-fontaine.fabrice@gmail.com>
 <20200229203416.3462566-2-fontaine.fabrice@gmail.com>
Message-ID: <87fteardka.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > An issue was discovered in Pure-FTPd 1.0.49. An out-of-bounds (OOB) read
 > has been detected in the pure_strcmp function in utils.c.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard

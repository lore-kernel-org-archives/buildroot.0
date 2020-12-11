From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Dec 2020 22:25:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/proftpd: bump to version 1.3.6e
In-Reply-To: <87h7p9riny.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sat, 28 Nov 2020 09:26:41 +0100")
References: <20201127201128.96175-1-fontaine.fabrice@gmail.com>
 <87h7p9riny.fsf@dell.be.48ers.dk>
Message-ID: <87czzgqblh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
 >> 1.3.6e
 >> ---------
 >> + Fixed null pointer deference in mod_sftp when using SCP incorrectly
 >> (Issue #1043).

 >> 1.3.6d
 >> ---------
 >> + Fixed issue with FTPS uploads of large files using TLSv1.3 (Issue #959).

 >> 1.3.6c
 >> ---------
 >> + Fixed regression in directory listing latency (Issue #863).
 >> + Detect OpenSSH-specific formatted SFTPHostKeys, and log hint for
 >> converting them to supported format.
 >> + Fixed use-after-free vulnerability during data transfers (Issue #903).
 >> + Fixed out-of-bounds read in mod_cap by updating the bundled libcap
 >> (Issue #902).

 >> http://proftpd.org/docs/RELEASE_NOTES-1.3.6e

 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 > Committed after marking it as a security bump and adding the affected
 > CVEs, thanks.

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard

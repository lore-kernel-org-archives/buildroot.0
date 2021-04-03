From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Apr 2021 12:15:58 +0200
Subject: [Buildroot] [PATCH 2/2] package/haserl: security bump to
 version 0.9.36
In-Reply-To: <20210329201026.254940-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 29 Mar 2021 22:10:26 +0200")
References: <20210329201026.254940-1-fontaine.fabrice@gmail.com>
 <20210329201026.254940-2-fontaine.fabrice@gmail.com>
Message-ID: <87lf9z7jxd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > 2021-03-07	0.9.36
 > *	Fix sf.net issue #5 - its possible to issue a PUT request
 > 	without a CONTENT-TYPE.   Assume an octet-stream in that case.
 > *	Change the Prefix for variables to be the REQUEST_METHOD
 > 	(PUT/DELETE/GET/POST)
 > 	**** THIS IS A BREAKING CHANGE vs 0.9.33 ****
 > *	Mitigations vs running haserl to get access to files not
 > 	available to the user.

 > - Fix CVE-2021-29133: Lack of verification in haserl, a component of
 >   Alpine Linux Configuration Framework, before 0.9.36 allows local users
 >   to read the contents of any file on the filesystem.
 > - Update indentation in hash file (two spaces)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard

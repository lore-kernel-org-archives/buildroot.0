From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 00:28:19 +0200
Subject: [Buildroot] [PATCH] openssh: bump to version 7.5
In-Reply-To: <8737e6mw34.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Tue, 21 Mar 2017 17:30:07 +0100")
References: <b556127655ac7c6e9c308e091067cb8a4f38574f.1490101882.git.baruch@tkos.co.il>
 <8737e6mw34.fsf@dell.be.48ers.dk>
Message-ID: <87fuhu1jss.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
 >> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

 > Committed after updating the commit message to mention that this release
 > fixes security issues, thanks:

 > Security
 > --------

 >  * ssh(1), sshd(8): Fix weakness in CBC padding oracle countermeasures
 >    that allowed a variant of the attack fixed in OpenSSH 7.3 to proceed.
 >    Note that the OpenSSH client disables CBC ciphers by default, sshd
 >    offers them as lowest-preference options and will remove them by
 >    default entriely in the next release. Reported by Jean Paul
 >    Degabriele, Kenny Paterson, Martin Albrecht and Torben Hansen of
 >    Royal Holloway, University of London.

 >  * sftp-client(1): [portable OpenSSH only] On Cygwin, a client making
 >    a recursive file transfer could be maniuplated by a hostile server to
 >    perform a path-traversal attack. creating or modifying files outside
 >    of the intended target directory. Reported by Jann Horn of Google
 >    Project Zero.

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard

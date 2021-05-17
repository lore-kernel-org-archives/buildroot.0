From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 May 2021 23:32:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/openssh: security bump to
 version 8.6p1
In-Reply-To: <20210515121035.2395250-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 15 May 2021 14:10:35 +0200")
References: <20210515121035.2395250-1-fontaine.fabrice@gmail.com>
Message-ID: <87im3hgi6x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Security
 > ========

 >  * sshd(8): OpenSSH 8.5 introduced the LogVerbose keyword. When this
 >    option was enabled with a set of patterns that activated logging
 >    in code that runs in the low-privilege sandboxed sshd process, the
 >    log messages were constructed in such a way that printf(3) format
 >    strings could effectively be specified the low-privilege code.

 >    An attacker who had sucessfully exploited the low-privilege
 >    process could use this to escape OpenSSH's sandboxing and attack
 >    the high-privilege process. Exploitation of this weakness is
 >    highly unlikely in practice as the LogVerbose option is not
 >    enabled by default and is typically only used for debugging. No
 >    vulnerabilities in the low-privilege process are currently known
 >    to exist.

 > https://www.openssh.com/txt/release-8.6

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard

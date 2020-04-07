From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Apr 2020 21:07:43 +0200
Subject: [Buildroot] [PATCH 1/5] package/gvfs: fix CVE-2019-3827
In-Reply-To: <20200329160246.4053834-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 29 Mar 2020 18:02:42 +0200")
References: <20200329160246.4053834-1-fontaine.fabrice@gmail.com>
Message-ID: <87pncjm7wg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > An incorrect permission check in the admin backend in gvfs before
 > version 1.39.4 was found that allows reading and modify arbitrary files
 > by privileged users without asking for password when no authentication
 > agent is running. This vulnerability can be exploited by malicious
 > programs running under privileges of users belonging to the wheel group
 > to further escalate its privileges by modifying system files without
 > user's knowledge. Successful exploitation requires uncommon system
 > configuration.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed all 5 to 2019.02.x, 2019.11.x and 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard

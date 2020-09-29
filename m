From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Sep 2020 17:35:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/cifs-utils: security bump to
 version 6.11
In-Reply-To: <20200920075720.636748-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 20 Sep 2020 09:57:20 +0200")
References: <20200920075720.636748-1-fontaine.fabrice@gmail.com>
Message-ID: <87sgb0wq7c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2020-14342: It was found that cifs-utils' mount.cifs was
 > invoking a shell when requesting the Samba password, which could be used
 > to inject arbitrary commands. An attacker able to invoke mount.cifs with
 > special permission, such as via sudo rules, could use this flaw to
 > escalate their privileges.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard

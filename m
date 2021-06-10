From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jun 2021 22:09:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/gupnp: security bump to version
 1.2.6
In-Reply-To: <20210601211221.144905-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 1 Jun 2021 23:12:21 +0200")
References: <20210601211221.144905-1-fontaine.fabrice@gmail.com>
Message-ID: <87bl8djxcg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2021-33516: An issue was discovered in GUPnP before 1.0.7 and
 > 1.1.x and 1.2.x before 1.2.5. It allows DNS rebinding. A remote web
 > server can exploit this vulnerability to trick a victim's browser into
 > triggering actions against local UPnP services implemented using this
 > library. Depending on the affected service, this could be used for data
 > exfiltration, data tempering, etc.

 > Replace patch by upstream commit as current patch doesn't apply cleanly

 > https://discourse.gnome.org/t/security-relevant-releases-for-gupnp-issue-cve-2021-33516/6536
 > https://gitlab.gnome.org/GNOME/gupnp/-/blob/gupnp-1.2.6/NEWS

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard

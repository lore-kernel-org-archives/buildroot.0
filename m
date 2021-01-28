From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 21:01:02 +0100
Subject: [Buildroot] [PATCH 1/1] package/sslh: systemd needs libconfig
In-Reply-To: <20210125223420.1357779-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 25 Jan 2021 23:34:20 +0100")
References: <20210125223420.1357779-1-fontaine.fabrice@gmail.com>
Message-ID: <87lfcc25mp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > systemd-sslh-generator unconditionally uses libconfig
 > Fixes:
 >  - http://autobuild.buildroot.org/results/d46581842906f7780f4a3a1ae21963e78e7f5276

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard

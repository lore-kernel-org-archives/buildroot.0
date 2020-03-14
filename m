From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 18:20:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/zsh: security bump to version
 5.8
In-Reply-To: <20200228224508.2026125-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 28 Feb 2020 23:45:08 +0100")
References: <20200228224508.2026125-1-fontaine.fabrice@gmail.com>
Message-ID: <87fteavonh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2019-20044: In Zsh before 5.8, attackers able to execute
 >   commands can regain privileges dropped by the --no-PRIVILEGED option.
 >   Zsh fails to overwrite the saved uid, so the original privileges can
 >   be restored by executing MODULE_PATH=/dir/with/module zmodload with a
 >   module that calls setuid().
 > - Update indentation of hash file (two spaces)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard

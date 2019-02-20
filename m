From: David Picard <dplamp@gmx.com>
Date: Wed, 20 Feb 2019 11:07:49 +0100
Subject: [Buildroot] minicom aborts
In-Reply-To: <20190219193553.21e11bc2@gmx.net>
References: <trinity-76e60e04-b256-49e6-9a96-952ff2003124-1550502581474@3c-app-mailcom-bs08>
 <20190218204417.5c943e3c@gmx.net>
 <03499d6b-bd94-b080-f5a9-53e6e0422e78@gmx.com>
 <20190219193553.21e11bc2@gmx.net>
Message-ID: <a8df1aa8-806f-2abb-724c-404af07c1d77@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Well, that looks cleaner than my quick and dirty patch...

But how do I enable a UTF8 locale ? A "grep LOCALE .config" returns this :

BR2_ENABLE_LOCALE_PURGE=y
BR2_ENABLE_LOCALE_WHITELIST="C en_US"

Thanks,
David

Le 19/02/2019 ? 19:35, Peter Seiderer a ?crit?:
> I can confirm minicom (without modifications) needs an UTF8 enabled locale
> (e.g. LANG=en_US.utf8) to run without the assert...

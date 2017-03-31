From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 09:03:23 +0200
Subject: [Buildroot] [PATCH 2/2] htop: use correct ncurses config script
	name
In-Reply-To: <20170326063654.10068-2-rprebello@gmail.com> (Rodrigo Rebello's
 message of "Sun, 26 Mar 2017 03:36:54 -0300")
References: <20170326063654.10068-1-rprebello@gmail.com>
 <20170326063654.10068-2-rprebello@gmail.com>
Message-ID: <87fuhux70k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Rodrigo" == Rodrigo Rebello <rprebello@gmail.com> writes:

 > The ncurses config script can have different names depending on the
 > configuration (e.g. wchar support enabled/disabled). So, use
 > $(NCURSES_CONFIG_SCRIPTS) from the ncurses package as it contains the
 > proper name.

 > Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard

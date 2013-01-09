From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Jan 2013 21:07:28 +0100
Subject: [Buildroot] [PATCH] dvbsnoop: new package dvbsnoop
In-Reply-To: <1357757772-10661-2-git-send-email-c.schoenert@gmail.com>
References: <201301091834.38893.yann.morin.1998@free.fr>
 <1357757772-10661-1-git-send-email-c.schoenert@gmail.com>
 <1357757772-10661-2-git-send-email-c.schoenert@gmail.com>
Message-ID: <20130109210728.6a51c9c9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carsten Schoenert,

On Wed,  9 Jan 2013 19:56:12 +0100, Carsten Schoenert wrote:

> +	  DVB analyzer / MPEG analyzer program to monitor, analyze, debug,
> +	  dump or view dvb/mpeg/dsm-cc/mhp stream information (TS, PES,
> +	  SECTION) (e.g. digital television) send via satellite, cable or
> +	  terrestrial.

Could you include a bit more details here? You have a lot of nice
details in your commit log, what about copy/pasting them here?


> +DVBSNOOP_LICENSE_FILE   = COPYING

Should be _LICENSE_FILES even if there is only one file.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

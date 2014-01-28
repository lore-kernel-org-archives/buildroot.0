From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jan 2014 22:54:48 +0100
Subject: [Buildroot] [PATCH 2/2] mpd: bump to version 0.18.7
In-Reply-To: <1389651438-13529-2-git-send-email-gustavo@zacarias.com.ar>
References: <1389651438-13529-1-git-send-email-gustavo@zacarias.com.ar>
 <1389651438-13529-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140128225448.3aa40140@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 13 Jan 2014 19:17:18 -0300, Gustavo Zacarias wrote:

> +	depends on !(BR2_avr32 || BR2_sparc) # gcc too old

Shouldn't we test on the GCC version here instead? There may very well
be modern SPARC toolchains, for example.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

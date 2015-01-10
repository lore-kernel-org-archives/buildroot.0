From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 18:55:05 +0100
Subject: [Buildroot] [PATCH 1/3] xtables-addons: new package
In-Reply-To: <1413925852-12765-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413925852-12765-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150110185505.6d929cd2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 21 Oct 2014 18:10:50 -0300, Gustavo Zacarias wrote:
> The geoip "helpers" are basically scripts that download and reformat
> the geoip database in a form usable by xt_geoip.
> The netfilter (kernel & userland) sides of it are built and installed.
> Since there are many considerations to geoip databases (free, commercial
> and variants for each) it's left to the user to deal with that if they
> plan to use the extension which is only one among many.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Thanks, I've applied the three patches of this series, only after doing
a minor set of changes on the first patch:

    [Thomas:
     - Take into account the rename of BR2_PREFER_STATIC_LIB to
       BR2_STATIC_LIBS
     - Remove "depends on BR2_LINUX_KERNEL" as suggested by Arnout.
     - Move XTABLES_ADDONS_CONF_OPTS a bit further down, with newlines
       around it, and adjust the indentation of the first line. Just to
       make it slightly more readable.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

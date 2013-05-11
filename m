From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 11 May 2013 22:43:05 +0200
Subject: [Buildroot] [PATCH 00/16] Handle more <pkg>-config scripts
In-Reply-To: <1368203379-3385-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 10 May 2013 18:29:22 +0200")
References: <1368203379-3385-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <874ne91c4m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> The allyespackageconfig build has revealed a number of packages that
 Thomas> are still installing a <pkg>-config script in target/usr/bin. This
 Thomas> patch series converts those packages to use the <pkg>_CONFIG_SCRIPTS
 Thomas> mechanism where appropriate, or to manual removal when
 Thomas> <pkg>_CONFIG_SCRIPTS is not appropriate (it's the case for
 Thomas> Python2/Python3).

 Thomas> Best regards,

 Thomas> Thomas

 Thomas> Thomas Petazzoni (16):
 Thomas>   libcgicc: handle cgicc-config script
 Thomas>   fltk: handle fltk-config script
 Thomas>   gsl: handle gsl-config script
 Thomas>   imlib2: handle imlib2-config script
 Thomas>   libart: handle libart2-config script
 Thomas>   libcdaudio: handle libcdaudio-config script
 Thomas>   libesmtp: handle libesmtp-config script
 Thomas>   libftdi: handle libftdi-config script
 Thomas>   libvncserver: handle libvncserver-config script
 Thomas>   netatalk: handle netatalk-config script
 Thomas>   netsnmp: handle net-snmp-config script
 Thomas>   liblog4c-localtime: remove whitespace at beginning of lines
 Thomas>   liblog4c-localtime: handle log4c-config script
 Thomas>   python: remove stale python2-config symbolic link
 Thomas>   python3: remove another config script
 Thomas>   sane-backends: handle sane-config script

Committed to next, thanks.

-- 
Bye, Peter Korsgaard

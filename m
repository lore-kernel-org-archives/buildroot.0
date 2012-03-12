From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Mar 2012 08:01:29 +0100
Subject: [Buildroot] [PATCH 2/3] libxml-parser-perl: add missing dep and
 drop wrong paths
In-Reply-To: <1331517531-2291-3-git-send-email-gustavo@zacarias.com.ar>
References: <1331517531-2291-1-git-send-email-gustavo@zacarias.com.ar>
 <1331517531-2291-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20120312080129.17b94348@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 11 Mar 2012 22:58:50 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

>  $(eval $(call GENTARGETS))

Same thing here: we don't need this anymore, since we don't support
building libxml-parser-perl for the target. And the
package/libxml-parser-perl/Config.in could go away as well.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

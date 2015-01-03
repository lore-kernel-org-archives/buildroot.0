From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Jan 2015 22:13:10 +0100
Subject: [Buildroot] [PATCH 2/2] msmtp: bump to version 1.6.0
In-Reply-To: <1420238707-5456-2-git-send-email-gustavo@zacarias.com.ar>
References: <1420238707-5456-1-git-send-email-gustavo@zacarias.com.ar>
 <1420238707-5456-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150103221310.124e2dd0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri,  2 Jan 2015 19:45:07 -0300, Gustavo Zacarias wrote:
> Also drop license comment from help, we have PKG_LICENSE* for that.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

This does much more than that: it adds an optional dependency on
libsecret, and remove --without-gnome-keyring. I've applied the patch
with an edited commit log, but for future patches, try to have more
detailed commit logs (or even do multiple separate patches for separate
issues). Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

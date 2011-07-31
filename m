From: Sven Neumann <s.neumann@raumfeld.com>
Date: Sun, 31 Jul 2011 20:41:45 +0200
Subject: [Buildroot] [PATCH 3/3] samba: bump to version 3.3.15
In-Reply-To: <1311884043-2473-3-git-send-email-gustavo@zacarias.com.ar>
References: <1311884043-2473-1-git-send-email-gustavo@zacarias.com.ar>
 <1311884043-2473-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1312137706.7121.2.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2011-07-28 at 17:14 -0300, Gustavo Zacarias wrote:
> Bump samba to version 3.3.15 and add security patches for CVE-2011-2522
> and CVE-2011-2694.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Why does buildroot still stick to such an old version of samba? We are
sucessfully using 3.5.9 in our branch (and could, and should, update to
3.5.10 easily). Would you like me to submit a patch to update samba to
version 3.5.x ?


Sven

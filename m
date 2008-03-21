From: JS <js@hipro.co.in>
Date: Sat, 22 Mar 2008 00:03:21 +0530
Subject: [Buildroot] question about /tftpboot
In-Reply-To: <d449ded70803211040i68f1d764gac70fdd27632ded5@mail.gmail.com>
References: <d449ded70803211040i68f1d764gac70fdd27632ded5@mail.gmail.com>
Message-ID: <1206124401.4692.2.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Fri, 2008-03-21 at 18:40 +0100, Habib Bouaziz-Viallet wrote:
> I would like my tftp server provides access to another directory (e.g
> /var/... param configured with /etc/inetd.conf  with my GNU Debian)
> 
> '/ tftpboot'. Changing '/ tftpboot' is apparently not possible from
> 'make menuconfig'

I usually symlink /tftpboot to whereever I want.. 

-- 
HiPro Solutions
http://hipro.co.in/

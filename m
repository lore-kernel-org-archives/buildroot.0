From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 30 Mar 2017 12:32:02 -0300 (BRT)
Subject: [Buildroot] How to run stysctl at system startup?
Message-ID: <1018995825.16946984.1490887922628.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The procps-ng package does not install a script at /etc/init.d to run

    sysctl --system

Is this purposeful? I can circumvent the problem by means of an init scrip
in my $(BR2_ROOTFS_OVERLAY)/etc/init.d/ but it would be nice to have that
script provided by default.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
Rua Am?rica, 1000 - Eldorado do Sul, RS, Brasil - 92990-000
casantos at datacom.ind.br          +55 51 3933.3000 ext. 3627
http://www.datacom.ind.br

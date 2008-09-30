From: Muktabh Anchlia <m_anchlia@hotmail.com>
Date: Tue, 30 Sep 2008 20:12:59 +0000
Subject: [Buildroot] wake on ring support
Message-ID: <BAY107-W4782F02FE41BDF61DCBA39D430@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HI,
I am trying to get wake on ring working on an advantech board with linux (built using buildroot, kernel version 2.6.24). I can make linux go to sleep using the command echo standby >/sys/power/state. But I am unable to wake it up using wake on ring. Advantech documents applying 5 volts on some pin to wake it up. Is there any parameter in buildroot config which enables/disables this support? It does work with windows Xp.

Thanks
Muktabh

" I don't take sides, just the racing line "

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080930/68ca1cee/attachment.htm 

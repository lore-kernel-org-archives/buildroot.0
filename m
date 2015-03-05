From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Mar 2015 11:33:14 +0100
Subject: [Buildroot] [PATCH] wireshark: security bump to version 1.12.4
In-Reply-To: <1425551374-11049-1-git-send-email-gustavo@zacarias.com.ar>
References: <1425551374-11049-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150305113314.13fb3f4b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu,  5 Mar 2015 07:29:34 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2015-2187 - The ATN-CPDLC dissector could crash.
> CVE-2015-2188 - The WCP dissector could crash.
> CVE-2015-2189 - The pcapng file parser could crash.
> CVE-2015-2190 - The LLDP dissector could crash.
> CVE-2015-2191 - The TNEF dissector could go into an infinite loop.
> CVE-2015-2192 - The SCSI OSD dissector could go into an infinite loop.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

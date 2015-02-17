From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Feb 2015 14:01:35 +0100
Subject: [Buildroot] [PATCH] sudo: security bump to version 1.8.12
In-Reply-To: <1424177451-19059-1-git-send-email-gustavo@zacarias.com.ar>
References: <1424177451-19059-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150217140135.5a59054a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 17 Feb 2015 09:50:51 -0300, Gustavo Zacarias wrote:
> Fixes CVE-2014-9680 - A user with sudo access may be able to exploit
> parsing bugs in the time zone parsing functions of the system's C
> library functions. The user may also be able to read arbitrary files,
> potentially causing changes in system behavior when reading certain
> device special files or simply causing the program run via sudo to
> block.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

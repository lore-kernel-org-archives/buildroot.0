From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Feb 2020 18:25:05 +0100
Subject: [Buildroot] [PATCH] package/fail2ban: add conditional
 python-systemd dependancy
In-Reply-To: <20200121104212.5621-1-p.debruijn@unilogic.nl> (Pascal de
 Bruijn's message of "Tue, 21 Jan 2020 11:42:12 +0100")
References: <20200121104212.5621-1-p.debruijn@unilogic.nl>
Message-ID: <87eevb1t3i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pascal" == Pascal de Bruijn <p.debruijn@unilogic.nl> writes:

 > fail2ban needs python-systemd for it's systemd backend to
 > be able to read logs from systemd/journald

 > Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>

Committed, thanks.

-- 
Bye, Peter Korsgaard

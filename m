From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 20:44:14 +0100
Subject: [Buildroot] [PATCH 4/7] rsyslog: clean up sysv initscript
In-Reply-To: <54B6C512.3090006@zacarias.com.ar>
References: <1421191022-5509-1-git-send-email-gustavo@zacarias.com.ar>
 <1421191022-5509-4-git-send-email-gustavo@zacarias.com.ar>
 <20150114203112.3412efb6@free-electrons.com>
 <54B6C512.3090006@zacarias.com.ar>
Message-ID: <20150114204414.3b1d4990@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 14 Jan 2015 16:35:46 -0300, Gustavo Zacarias wrote:

> > Do we really need this umask 077 ?
> 
> Leftover, i'll kill it.

Thanks.

> > And this sleep 1 ?
> 
> Unfortunately yes, it seems rsyslogd doesn't exit immediately from the
> tests i've made, otherwise i got restart problems in very few cases.

Argh, I hate this. But OK :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 20:43:44 +0100
Subject: [Buildroot] [PATCH 3/7] rsyslog: rename sysv initscript to
 S01logging
In-Reply-To: <54B6C4A6.6010204@zacarias.com.ar>
References: <1421191022-5509-1-git-send-email-gustavo@zacarias.com.ar>
 <1421191022-5509-3-git-send-email-gustavo@zacarias.com.ar>
 <20150114203051.513c370c@free-electrons.com>
 <54B6C4A6.6010204@zacarias.com.ar>
Message-ID: <20150114204344.1c09a80b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 14 Jan 2015 16:33:58 -0300, Gustavo Zacarias wrote:

> > Comments from others are welcome, I don't consider the proposed
> > solution to be set in stone.
> 
> It's the best deterministic option we've got, rsyslog builds after
> busybox (famous dependency trickery) but then again there's no clear
> winner with sysklogd (the default shell dilemma).
> We could throw an option for logger, but i think that would be crowding
> things a little.
> I'm not opposed to it or other solutions though.

Yeah, I agree, there's no immediately perfect solution that comes to
mind. Maybe we don't want to handle too much of these issues, and leave
it to the user to realize that building both rsyslog and syslogd is
stupid.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Sep 2017 16:14:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/sysklogd: add systemd services
In-Reply-To: <1505902890-5891-1-git-send-email-brain@jikos.cz>
References: <1505902890-5891-1-git-send-email-brain@jikos.cz>
Message-ID: <28bea21f-351b-06fe-d870-b46ef668d1b4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-09-17 12:21, Petr Kulhavy wrote:
> Sysklogd had only SYSV init scripts. Add systemd service filesto start klogd
> and syslogd.
> 
> Signed-off-by: Petr Kulhavy <brain@jikos.cz>

 Applied to master, thanks.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

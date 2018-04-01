From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 1 Apr 2018 14:08:23 +0200
Subject: [Buildroot] [PATCH 1/1] python-xlrd: add as host package
In-Reply-To: <1508531674-6145-1-git-send-email-lothar.felten@gmail.com>
References: <1508531674-6145-1-git-send-email-lothar.felten@gmail.com>
Message-ID: <295e0600-aa90-75c7-9b2c-ed75bbdf0639@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-10-17 22:34, Lothar Felten wrote:
> This patch adds the xlrd module for the host.
> Currently there is no buildroot package that depends on this module.
> 
> I use it to process excel files, other might find it usefull too.

 Applied to master, thanks. You had forgotten to add it to
package/Config.in.host though.

 Regards,
 Arnout

> 
> Signed-off-by: Lothar Felten <lothar.felten@gmail.com>[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

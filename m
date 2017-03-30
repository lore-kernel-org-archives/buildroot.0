From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 30 Mar 2017 23:08:04 +0200
Subject: [Buildroot] [PATCH 02/21] package: use SPDX short identifier
	for GPLv1/GPLv1+
In-Reply-To: <1490881430-10434-3-git-send-email-rahulbedarkar89@gmail.com>
References: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
 <1490881430-10434-3-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <d927e651-8499-bd65-9181-0806c7fafda5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30-03-17 15:43, Rahul Bedarkar wrote:
> We want to use SPDX identifier for licenses as much as possible. SPDX
> short identifier for GPLv1/GPLv1+ is GPL-1.0/GPL-1.0+.
> 
> This change is done using following command.
> find . -name "*.mk" | xargs sed -ri '/LICENSE( )?[\+:]?=/s/GPLv1(\+)?/GPL-1.0\1/g'
                                                                  ^^^^
                                                              This bit is not
really needed, and in subsequent patches you indeed dropped it. Anyway it
doesn't affect the result.

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(yes, I looked at the entire patch!)

 Regards,
 Arnout
> 
> Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

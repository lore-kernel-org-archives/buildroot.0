From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 30 Mar 2017 23:50:26 +0200
Subject: [Buildroot] [PATCH 03/21] boot, linux,
 package: use SPDX short identifier for GPLv2/GPLv2+
In-Reply-To: <1490881430-10434-4-git-send-email-rahulbedarkar89@gmail.com>
References: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
 <1490881430-10434-4-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <e94d5cce-df0c-23b3-1a32-e1674822d1a6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30-03-17 15:43, Rahul Bedarkar wrote:
> We want to use SPDX identifier for license strings as much as possible.
> SPDX short identifier for GPLv2/GPLv2+ is GPL-2.0/GPL-2.0+.
> 
> This change is done by using following command.
> find . -name "*.mk" | xargs sed -ri '/LICENSE( )?[\+:]?=/s/\<GPLv2\>/GPL-2.0/g'
> 
> Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

I gave up at strongswan, and instead I just did the reverse
sed s/GPL-2.0/GPLv2/ and reviewed that...

 Note that this patch doesn't appear in patchwork.

 Before applying, please run the sed command again to check that no new packages
were added with GPLv2.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

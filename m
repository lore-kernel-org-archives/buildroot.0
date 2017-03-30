From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 30 Mar 2017 23:56:47 +0200
Subject: [Buildroot] [PATCH 04/21] boot,
 package: use SPDX short identifier for GPLv3/GPLv3+
In-Reply-To: <1490881430-10434-5-git-send-email-rahulbedarkar89@gmail.com>
References: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
 <1490881430-10434-5-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <9036f4ae-2d0a-4ea7-741d-7bfb32d41627@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30-03-17 15:43, Rahul Bedarkar wrote:
> We want to use SPDX identifier for license string as much as possible.
> SPDX short identifier for GPLv3/GPLv3+ is GPL-3.0/GPL-3.0+.
> 
> This change is done using following command.
> find . -name "*.mk" | xargs sed -ri '/LICENSE( )?[\+:]?=/s/\<GPLv3\>/GPL-3.0/g'
> 
> Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Fully reviewed manually again, as well as with the reverse sed.
But now I have a headache :-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 9 Oct 2015 13:31:40 +0100
Subject: [Buildroot] [PATCH 1/2] collectd: drop rrdtool selects
In-Reply-To: <1444330860-31735-1-git-send-email-gustavo@zacarias.com.ar>
References: <1444330860-31735-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <5617B3AC.3010301@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 10/08/2015 08:00 PM, Gustavo Zacarias wrote:
> Drop indirect rrdtool selects, they're already selected by rrdtool
> itself so there's no need.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Indeed, rrdtool package already selects freetype, libart, libpng and zlib.

Regards,

Vincent.

From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 06 Jan 2015 08:08:55 -0300
Subject: [Buildroot] [PATCH] automake: bump version to 1.15
In-Reply-To: <1420535267-45405-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1420535267-45405-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <54ABC247.9030500@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/06/2015 06:07 AM, Vicente Olivert Riera wrote:

> -Bump version to 1.15
> -Add a hash file
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Hi.
Out of curiosity, did you try an allyespackageconfig build with this
one? Major automake bumps tend to break some autoreconf'ed packages that
use deprecated features.
Regards.

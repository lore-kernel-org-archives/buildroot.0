From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 Sep 2015 10:26:35 -0300
Subject: [Buildroot] [PATCH] samba4: bump version to 4.3.0
In-Reply-To: <1441977158-2546-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1441977158-2546-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <55F2D68B.9000802@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/09/15 10:12, Vicente Olivert Riera wrote:

> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

If you build as-is with powerpc-uclibcng-rpc-wchar it will fail with 
stack smashing protection failures since the tests are probably lax to 
detect it (very likely for other architectures on uclibc-ng as well).
So as-is nack, it needs some more work.
Regards.

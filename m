From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 22:48:44 +0200
Subject: [Buildroot] [PATCH 2/3] package/argp-standalone: add missing
 limits.h
In-Reply-To: <1430498686-10719-2-git-send-email-romain.naour@openwide.fr>
References: <1430498686-10719-1-git-send-email-romain.naour@openwide.fr>
 <1430498686-10719-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150501224844.368fa119@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Fri,  1 May 2015 18:44:45 +0200, Romain Naour wrote:
> Fixes:
> http://autobuild.buildroot.net/results/b80/b802cc638a4b11d2a2098b82615f2c0ccadf8e3f/build-end.log
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  package/argp-standalone/0002-isprint.patch | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)

I have already done a similar fix a few hours ago:
http://git.buildroot.net/buildroot/commit/?id=2a4ece2ed3e3766c463ef8f61a3362ba86c8a6cf.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

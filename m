From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 9 Mar 2016 00:40:33 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-03-07
In-Reply-To: <20160308073022.EFA101019EE@stock.ovh.net>
References: <20160308073022.EFA101019EE@stock.ovh.net>
Message-ID: <56DF62F1.1020302@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/03/2016 08:30, Thomas Petazzoni wrote:
[...]

>       x86_64 |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/5069fdd4c4a09a6bae2dcbf1f631ece561fe2df0/

Looks like an issue with parallel building. But before forcing MAKE1, I
at least would like to be able to reproduce it... I've tried a few
builds with arbitrary BR2_JLEVEL values but couldn't see it fail here so
far.

-- 
Luca

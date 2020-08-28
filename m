From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 17:52:58 +0200
Subject: [Buildroot] [PATCH v3 3/3] support/scripts/pkg-stats: show
 progress of upstream URL and latest version
In-Reply-To: <20200808180826.1007656-4-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 8 Aug 2020 20:08:25 +0200")
References: <20200808180826.1007656-1-thomas.petazzoni@bootlin.com>
 <20200808180826.1007656-4-thomas.petazzoni@bootlin.com>
Message-ID: <87bliuwyw5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > This commit slightly improves the output of pkg-stats by showing the
 > progress of the upstream URL checks and latest version retrieval, on a
 > package basis:

 > Checking URL status
 > [0001/0062] curlpp
 > [0002/0062] cmocka
 > [0003/0062] snappy
 > [0004/0062] nload
 > [...]
 > [0060/0062] librtas
 > [0061/0062] libsilk
 > [0062/0062] jhead
 > Getting latest versions ...
 > [0001/0064] libglob
 > [0002/0064] perl-http-daemon
 > [0003/0064] shadowsocks-libev
 > [...]
 > [0061/0064] lua-flu
 > [0062/0064] python-aiohttp-security
 > [0063/0064] ljlinenoise
 > [0064/0064] matchbox-lib

 > Note that the above sample was run on 64 packages. Only 62 packages
 > appear for the URL status check, because packages that do not have any
 > URL in their Config.in file, or don't have any Config.in file at all,
 > are not checked and therefore not accounted.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
